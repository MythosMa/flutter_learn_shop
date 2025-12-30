import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

class Suggestion extends StatefulWidget {
  final HotPreference hotPreference;
  const Suggestion({super.key, required this.hotPreference});

  @override
  State<Suggestion> createState() => _SuggestionState();
}

Widget _header() {
  return Row(
    children: [
      Text(
        "特惠推荐",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 126, 61, 8),
        ),
      ),
      SizedBox(width: 10),
      Text(
        "精选省攻略",
        style: TextStyle(
          fontSize: 16,
          color: const Color.fromARGB(255, 126, 61, 8),
        ),
      ),
    ],
  );
}

Widget _contentLeft() {
  return Container(
    width: 100,
    height: 140,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("lib/assets/home_cmd_inner.png"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

class _SuggestionState extends State<Suggestion> {
  List<GoodsItem> _getDisplayItems() {
    if (widget.hotPreference.subTypes.isEmpty) {
      return [];
    }
    return widget.hotPreference.subTypes.first.goodsItems.items
        .take(3)
        .toList();
  }

  List<Widget> _contentRightList() {
    List<GoodsItem> items = _getDisplayItems();
    return List.generate(items.length, (index) {
      GoodsItem item = items[index];
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/home_cmd_sm.png"),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            _header(),
            SizedBox(height: 10),
            Row(
              children: [
                _contentLeft(),
                SizedBox(width: 10),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    spacing: 10,
                    children: _contentRightList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
