import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

class Category extends StatefulWidget {
  final List<CategoryItem> categoryList;

  const Category({super.key, required this.categoryList});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) {
          final category = widget.categoryList[index];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 100,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 230, 230, 228),
              borderRadius: BorderRadius.circular(40),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(category.picture, width: 50, height: 50),
                Text(
                  category.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
