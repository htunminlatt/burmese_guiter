import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarouselViewWidget extends StatefulWidget {
  const CarouselViewWidget({super.key, required this.isShowIndicator});
  final bool isShowIndicator;

  @override
  State<CarouselViewWidget> createState() => _CarouselViewWidgetState();
}

class _CarouselViewWidgetState extends State<CarouselViewWidget> {
  final List<String> carouselSliderarray = [
      kCarouselImage,
      kCarouselImage,
      kCarouselImage,
      kCarouselImage,
      kCarouselImage
    ];

  int _currentIndex = 0;

    CarouselSliderController indicatorController = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 260,
              width: MediaQuery.of(context).size.width,
              child: CarouselSlider(
                carouselController: indicatorController,
                options: CarouselOptions(
                  autoPlay: true,
                  height: 260.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: carouselSliderarray.map((imageString) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(color: kDarkGrayColor),
                        child: Image.asset(
                          imageString,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            Center(child: SizedBox(height: 56,width: 56,child: Image.asset(kPlayButtonLogo),)),
            Visibility(
              visible: widget.isShowIndicator,
              child: Positioned(
                  bottom: -15,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: carouselSliderarray.asMap().entries.map((value) {
                      return GestureDetector(
                        onTap: () {
                          indicatorController.animateToPage(value.key);
                        },
                        child: Container(
                          width: _currentIndex == value.key ? 15 : 5,
                          height: 5,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: _currentIndex == value.key
                                  ? kPrimaryColor
                                  : kDarkGrayColor),
                        ),
                      );
                    }).toList(),
                  )),
            )
          ],
        );
  }
}