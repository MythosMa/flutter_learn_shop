import 'package:flutter_learn_shop/api/dio_request.dart';
import 'package:flutter_learn_shop/constants/index.dart';
import 'package:flutter_learn_shop/pages/home/components/hot.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

Future<List<BannerItem>> getBannerListApi() async {
  return ((await dioRequest.get(HttpConstants.BANNER_LIST)) as List)
      .map((item) => BannerItem.fromJson(item as Map<String, dynamic>))
      .toList();
}

Future<List<CategoryItem>> getCategoryListApi() async {
  return ((await dioRequest.get(HttpConstants.CATEGORY_LIST)) as List)
      .map((item) => CategoryItem.fromJson(item as Map<String, dynamic>))
      .toList();
}

Future<HotPreference> getHotPreferenceApi() async {
  return HotPreference.fromJson(
    await dioRequest.get(HttpConstants.HOT_PREFERENCE),
  );
}

Future<HotPreference> getHotInVogueApi() async {
  return HotPreference.fromJson(
    await dioRequest.get(HttpConstants.HOT_IN_VOGUE),
  );
}

Future<HotPreference> getHotOneStopApi() async {
  return HotPreference.fromJson(
    await dioRequest.get(HttpConstants.HOT_ONE_STOP),
  );
}
