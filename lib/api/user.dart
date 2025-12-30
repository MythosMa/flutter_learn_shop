import 'package:flutter_learn_shop/api/dio_request.dart';
import 'package:flutter_learn_shop/constants/index.dart';
import 'package:flutter_learn_shop/viewmodels/user.dart';

Future<UserInfo> loginApi(Map<String, dynamic> data) async {
  return UserInfo.fromJson(
    await dioRequest.post(HttpConstants.LOGIN, data: data),
  );
}

Future<UserInfo> getUserInfoApi() async {
  return UserInfo.fromJson(await dioRequest.get(HttpConstants.USER_PROFILE));
}
