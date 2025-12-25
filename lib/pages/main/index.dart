import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/pages/cart/index.dart';
import 'package:flutter_learn_shop/pages/category/index.dart';
import 'package:flutter_learn_shop/pages/home/index.dart';
import 'package:flutter_learn_shop/pages/my/index.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _tabList = [
    {
      "title": "首页",
      "icon": "lib/assets/ic_public_home.png",
      'icon_active': 'lib/assets/ic_public_home_active.png',
    },
    {
      "title": "分类",
      "icon": "lib/assets/ic_public_category.png",
      'icon_active': 'lib/assets/ic_public_category_active.png',
    },
    {
      "title": "购物车",
      "icon": "lib/assets/ic_public_cart.png",
      'icon_active': 'lib/assets/ic_public_cart_active.png',
    },
    {
      "title": "我的",
      "icon": "lib/assets/ic_public_my.png",
      'icon_active': 'lib/assets/ic_public_my_active.png',
    },
  ];

  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentTabIndex,
          children: [HomeView(), CategoryView(), CartView(), MyView()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentTabIndex = index;
          });
        },
        items: List.generate(_tabList.length, (index) {
          return BottomNavigationBarItem(
            icon: Image.asset(_tabList[index]['icon']!, width: 30, height: 30),
            label: _tabList[index]['title']!,
            activeIcon: Image.asset(
              _tabList[index]['icon_active']!,
              width: 30,
              height: 30,
            ),
          );
        }),
      ),
    );
  }
}
