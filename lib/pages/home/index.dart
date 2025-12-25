import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/pages/home/components/carousel.dart';
import 'package:flutter_learn_shop/pages/home/components/category.dart';
import 'package:flutter_learn_shop/pages/home/components/hot.dart';
import 'package:flutter_learn_shop/pages/home/components/more.dart';
import 'package:flutter_learn_shop/pages/home/components/suggestion.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Carousel()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Category()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Suggestion()),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              Expanded(child: Hot()),
              Expanded(child: Hot()),
            ],
          ),
        ),
      ),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        sliver: More(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: getScrollChildren());
  }
}
