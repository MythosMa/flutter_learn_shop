class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(id: json['id'] ?? '', imgUrl: json['imgUrl'] ?? '');
  }
}

class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;

  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      picture: json['picture'] ?? '',
      children: json['children'] != null
          ? (json['children'] as List)
                .map(
                  (child) =>
                      CategoryItem.fromJson(child as Map<String, dynamic>),
                )
                .toList()
          : null,
    );
  }
}

class HotPreference {
  final String id;
  final String title;
  final List<SubType> subTypes;

  HotPreference({
    required this.id,
    required this.title,
    required this.subTypes,
  });

  factory HotPreference.fromJson(Map<String, dynamic> json) {
    return HotPreference(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      subTypes: (json['subTypes'] as List? ?? [])
          .map((e) => SubType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SubType {
  final String id;
  final String title;
  final GoodsItems goodsItems;

  SubType({required this.id, required this.title, required this.goodsItems});

  factory SubType.fromJson(Map<String, dynamic> json) {
    return SubType(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      goodsItems: GoodsItems.fromJson(
        json['goodsItems'] as Map<String, dynamic>,
      ),
    );
  }
}

class GoodsItems {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodsItem> items;

  GoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodsItems.fromJson(Map<String, dynamic> json) {
    return GoodsItems(
      counts: json['counts']?.toInt() ?? 0,
      pageSize: json['pageSize']?.toInt() ?? 0,
      pages: json['pages']?.toInt() ?? 0,
      page: json['page']?.toInt() ?? 0,
      items: (json['items'] as List? ?? [])
          .map((e) => GoodsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class GoodsItem {
  final String id;
  final String name;
  final String desc;
  final String price;
  final String picture;
  final int orderNum;

  GoodsItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });

  factory GoodsItem.fromJson(Map<String, dynamic> json) {
    return GoodsItem(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      desc: json['desc']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      picture: json['picture']?.toString() ?? '',
      orderNum: json['orderNum']?.toInt() ?? 0,
    );
  }
}

class GoodDetailItem extends GoodsItem {
  int payCount = 0;
  GoodDetailItem({
    required super.id,
    required super.name,
    required super.price,
    required super.picture,
    required super.orderNum,
    required this.payCount,
  }) : super(desc: "");

  factory GoodDetailItem.fromJson(Map<String, dynamic> json) {
    return GoodDetailItem(
      id: json["id"]?.toString() ?? "",
      name: json["name"]?.toString() ?? "",
      price: json["price"]?.toString() ?? "",
      picture: json["picture"]?.toString() ?? "",
      orderNum: int.tryParse(json["orderNum"]?.toString() ?? "0") ?? 0,
      payCount: int.tryParse(json["payCount"]?.toString() ?? "0") ?? 0,
    );
  }
}

class GoodDetailsItems {
  final int counts;
  final int pageSize;
  final int pages;
  final int page;
  final List<GoodDetailItem> items;

  GoodDetailsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });

  factory GoodDetailsItems.fromJson(Map<String, dynamic> json) {
    return GoodDetailsItems(
      counts: json['counts']?.toInt() ?? 0,
      pageSize: json['pageSize']?.toInt() ?? 0,
      pages: json['pages']?.toInt() ?? 0,
      page: json['page']?.toInt() ?? 0,
      items: (json['items'] as List? ?? [])
          .map((e) => GoodDetailItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
