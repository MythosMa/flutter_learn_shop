import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_shop/viewmodels/home.dart';

class Carousel extends StatefulWidget {
  final List<BannerItem> bannerList;
  const Carousel({super.key, required this.bannerList});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentCarouselIndex = 0;

  Widget _getCarousel() {
    return CarouselSlider(
      carouselController: _carouselController,
      items: List.generate(widget.bannerList.length, (index) {
        return Image.network(
          widget.bannerList[index].imgUrl,
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        );
      }),
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          setState(() {
            _currentCarouselIndex = index;
          });
        },
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
      ),
    );
  }

  Widget _getCarouselDot() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 10,
      child: SizedBox(
        height: 40,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.bannerList.length, (index) {
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 100),
                );
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: 6,
                width: _currentCarouselIndex == index ? 40 : 20,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: _currentCarouselIndex == index
                      ? Colors.white
                      : Colors.white.withAlpha(150),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget _getSearchBar() {
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 40,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.8),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [_getCarousel(), _getSearchBar(), _getCarouselDot()],
    );
  }
}
