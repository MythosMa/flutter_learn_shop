import 'package:flutter_learn_shop/api/dio_request.dart';
import 'package:flutter_learn_shop/constants/index.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListApi() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List)
      .map((item) => BannerItem.fromJson(item as Map<String, dynamic>))
      .toList();
}
