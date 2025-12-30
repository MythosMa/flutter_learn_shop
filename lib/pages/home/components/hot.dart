import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

class Hot extends StatefulWidget {
  final HotPreference hotPreference;
  final int type; // 1: inVogue, 2: oneStop
  const Hot({super.key, required this.hotPreference, required this.type});

  @override
  State<Hot> createState() => _HotState();
}

class _HotState extends State<Hot> {
  List<GoodsItem> get _getDisplayItems {
    if (widget.hotPreference.subTypes.isEmpty) {
      return [];
    }
    return widget.hotPreference.subTypes.first.goodsItems.items
        .take(2)
        .toList();
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _header() {
    return Row(
      children: [
        Text(
          widget.type == 1 ? "爆款推荐 " : "一站买全",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 126, 61, 8),
          ),
        ),
        SizedBox(width: 10),
        Text(
          widget.type == 1 ? "最受欢迎" : "精心优选",
          style: TextStyle(
            fontSize: 14,
            color: const Color.fromARGB(255, 126, 61, 8),
          ),
        ),
      ],
    );
  }

  Widget _getItemWidget(GoodsItem item) {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: Image.network(
              errorBuilder: (context, error, stackTrace) => Image.asset(
                "lib/assets/home_cmd_inner.png",
                // width: 80,
                height: 120,
                fit: BoxFit.cover,
              ),
              item.picture,
              // width: 80,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              "¥${item.price}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.type == 1
            ? const Color.fromARGB(255, 255, 228, 225)
            : const Color.fromARGB(255, 225, 245, 254),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          _header(),
          SizedBox(height: 10),
          Row(
            children: [
              ..._getDisplayItems.map((item) {
                return Expanded(child: _getItemWidget(item));
              }),
            ],
          ),
        ],
      ),
    );
  }
}
