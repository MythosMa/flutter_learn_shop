import 'package:dio/dio.dart';
import 'package:flutter_learn_shop/constants/index.dart';
import 'package:flutter_learn_shop/stores/tokenManager.dart';

class DioRequest {
  final _dio = Dio();
  DioRequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.DEFAULT_TIMEOUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.DEFAULT_TIMEOUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.DEFAULT_TIMEOUT);

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          if (tokenManager.getToken().isNotEmpty) {
            request.headers['authorization'] =
                "Bearer ${tokenManager.getToken()}";
          }
          handler.next(request);
        },

        onResponse: (response, handler) {
          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            handler.next(response);
            return;
          }
          handler.reject(DioException(requestOptions: response.requestOptions));
        },

        onError: (error, handler) {
          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              message: error.response?.data?['message'] ?? '接口发生错误',
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> get(String url, {Map<String, dynamic>? queryParameters}) {
    return _handleResponse(_dio.get(url, queryParameters: queryParameters));
  }

  Future<dynamic> post(String url, {Map<String, dynamic>? data}) {
    return _handleResponse(_dio.post(url, data: data));
  }

  Future<dynamic> _handleResponse(Future<Response<dynamic>> task) async {
    try {
      Response<dynamic> result = await task;
      final data = result.data as Map<String, dynamic>;
      if (data['code'] == GlobalConstants.SUCCESS_CODE) {
        return data['result'];
      }
      throw DioException(
        requestOptions: result.requestOptions,
        message: data['msg'] ?? '接口发生错误',
      );
    } catch (e) {
      // throw Exception(e);
      rethrow;
    }
  }
}

final dioRequest = DioRequest();
