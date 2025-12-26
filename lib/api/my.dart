import 'package:flutter_learn_shop/api/dio_request.dart';
import 'package:flutter_learn_shop/constants/index.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

Future<GoodDetailsItems> getGuessLikeApi(Map<String, dynamic> params) async {
  return GoodDetailsItems.fromJson(
    await dioRequest.get(HttpConstants.GUESS_LIST, queryParameters: params),
  );
}
