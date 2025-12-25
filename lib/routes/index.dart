import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/pages/main/index.dart';
import 'package:flutter_learn_shop/pages/login/index.dart';

Widget getRouteWidget() {
  return MaterialApp(routes: getRoutes(), initialRoute: "/");
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {"/": (context) => MainPage(), "/login": (context) => LoginPage()};
}
