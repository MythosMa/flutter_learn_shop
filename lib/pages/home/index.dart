import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/api/home.dart';
import 'package:flutter_learn_shop/pages/home/components/carousel.dart';
import 'package:flutter_learn_shop/pages/home/components/category.dart';
import 'package:flutter_learn_shop/pages/home/components/hot.dart';
import 'package:flutter_learn_shop/pages/home/components/more.dart';
import 'package:flutter_learn_shop/pages/home/components/suggestion.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CategoryItem> _categoryList = [];
  List<BannerItem> _bannerList = [
    // BannerItem(
    //   id: "1",
    //   imageUrl:
    //       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ--DO3WYPeERp0QlH71PFni6ALqE9e4lZTbQ&sv8AN/kE0NKD9wy/sBP0KfxQe7r/ADf5JOTab1DPcCXoQ+KD3db5v8ipMl0h1wR+59Ee3h8UNayt82VX5HofVs4Ype3p/Efvq/zB/cFER9yOwO8Ee2p/Ea19f5CJM2qP1JPBzx81H21PsT/yFf5f6AbmxRXvybuGmSEe1p9ge0K/f/RsQaLGhrW6LRqAGHwVyikrIySm5O7d2H5WN/wKLCFOrR19xPySsMGSt6z3FFhizUC/TbjvcPkjcC4Jl/uHeEtxD3i6GH0vgFoKCQzeb9gSAJzeodwQB4Ajb8AgBvK7jZAj2k70h7qADc92wjtQMgOffU2yOAgXxE7O5xQAmWJxbax7HkfFACI6N7dTnDi8n5oGPEcw/rNt1t+hQHAYDLbpRnDrQBRggrG65I3Y44EYdSQ+BpNkkGsA8CmIdpnckBHKG9tHvCAI5Q+igDzndXzQAl1j/wCpgL5PqHDA+CAuLl5trMvfWWgYIsAQ6gfdH0QFzxfbYewIsAJm6j2hFgFGduom/eEWAgNF7gkd30QAWjx/XagYLnHefdRYAA8/oH6IsAd+sfFFguCePwRYLgns+CVh3EFuJJIPUdHDtsiwXEuib6Df+P0RYLmkKgKRA95QEAQKgb0AND2nagD12oAPyhFgDZOlYYwSIANr0AFpBAjxcEDPaQ3IADSbuQInlGoAgvagCBIEWA8ZBvQBGl1oA8T1oAU5wCYAPx2lAwRxQIJrutAzziN6QA360xABqBglqABLEAQWce9AHiy+0hAAPhJ84oAS+A+kgZAjNsXXQAmSJAEBnUEBcDlHIEA+VyBlfyt20IuFi1T1u9ArF+OoBQIPSB2pgMY3rSAe1p3oANAHrlMROKAPEFIACCmM9igQLnFAyA9AgHvQAHLJgSalKwCXVCdgI5dFgANQUWAHygpDCbOUANZIUAMugAXXQBFygAtMoAguKABLigYiV5SApySkbUwKz6o70hi/LDvQBvCnQIh1MEAV5aEFAXFCjsgBghTEGGFAD4nEIAtxyoAcHpAEEAG1qAGaKQAliABLEwFPjQAh0SdwFmNFwALEAA5iLgRoJgQWoFYRJdK4yu4lK47HhK5MQbagoAeypQA3yhAAPqkAJ8sTAsRT3SAcCgAXMCAEywBAFOWkCBlU0iAP/9k=",
    // ),
    // BannerItem(
    //   id: "2",
    //   imageUrl:
    //       "https://www.ourchinastory.com/images/content/travel-leisure/2021/11/%E7%95%B6%E4%BB%A3%E4%B8%AD%E5%9C%8B-%E4%B8%AD%E5%9C%8B%E6%97%85%E9%81%8A-%E5%8C%97%E4%BA%AC%E6%97%85%E9%81%8A-%E5%8C%97%E4%BA%AC-%E5%8C%97%E4%BA%AC%E6%95%85%E5%AE%AE-%E6%95%85%E5%AE%AE%E8%B2%93-03_x1.jpg",
    // ),
    // BannerItem(
    //   id: "3",
    //   imageUrl:
    //       "https://img.36krcdn.com/20210111/v2_c149e603e11b407a817eaa86bcce2596_img_png",
    // ),
  ];

  HotPreference _hotPreference = HotPreference(id: "", title: "", subTypes: []);
  HotPreference _hotInVogue = HotPreference(id: "", title: "", subTypes: []);
  HotPreference _hotOneStop = HotPreference(id: "", title: "", subTypes: []);

  @override
  void initState() {
    super.initState();
    _getBannerList();
    _getCategoryList();
    _getHotPreference();
    _getHotInVogue();
    _getHotOneStop();
  }

  Future<void> _getCategoryList() async {
    _categoryList = await getCategoryListApi();
    setState(() {});
  }

  Future<void> _getBannerList() async {
    _bannerList = await getBannerListApi();
    setState(() {});
  }

  Future<void> _getHotPreference() async {
    _hotPreference = await getHotPreferenceApi();
    setState(() {});
  }

  Future<void> _getHotInVogue() async {
    _hotInVogue = await getHotInVogueApi();
    setState(() {});
  }

  Future<void> _getHotOneStop() async {
    _hotOneStop = await getHotOneStopApi();
    setState(() {});
  }

  List<Widget> getScrollChildren() {
    return [
      SliverToBoxAdapter(child: Carousel(bannerList: _bannerList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Category(categoryList: _categoryList)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(child: Suggestion(hotPreference: _hotPreference)),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            spacing: 10,
            children: [
              Expanded(child: Hot(hotPreference: _hotInVogue, type: 1)),
              Expanded(child: Hot(hotPreference: _hotOneStop, type: 2)),
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
