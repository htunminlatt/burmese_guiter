import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ChordLibraryScreen extends StatelessWidget {
  const ChordLibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> chordTitleArray = ['C', 'Db', 'D', 'Eb', 'E', 'F'];
    List<String> chordSubTitleArray = [
      'Major',
      'Minor',
      '5',
      '7',
      'Maj7',
      'm7',
      '7#9',
      'Sus4',
      'Add9',
      'Sus2',
      '7sus4',
      '9'
    ];

    PageController pageController = PageController();

    return Scaffold(
        backgroundColor: kDarkColor,
        appBar: AppBar(
          foregroundColor: kWhiteColor,
          backgroundColor: kAppBarColor,
          surfaceTintColor: kAppBarColor,
          title: const Text('Chord-Library'),
          centerTitle: false,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              width: 49,
              height: 27,
              decoration: BoxDecoration(
                  color: kDarkColor, borderRadius: BorderRadius.circular(16)),
              child: Center(
                child: Text(
                  'b',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, color: kWhiteColor),
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 78,
                child: Column(
                  
                  children: [
                    const SizedBox(
                      height: 8,
                    ),

                    //session 1
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: SizedBox(
                        height: 27,
                        child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: chordTitleArray.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                height: 27,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.only(right: 3),
                                decoration: BoxDecoration(
                                    color: kAppBarColor,
                                    borderRadius: BorderRadius.circular(16)),
                                child: Center(
                                  child: Text(
                                    chordTitleArray[index],
                                    style: TextStyle(color: kWhiteColor),
                                  ),
                                ),
                              );
                            })),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),

                    //session2
                    SizedBox(
                      height: 27,
                      child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          scrollDirection: Axis.horizontal,
                          itemCount: chordSubTitleArray.length,
                          itemBuilder: ((context, index) {
                            return Container(
                              height: 27,
                              margin: const EdgeInsets.only(right: 3),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: kAppBarColor,
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                child: Text(
                                  chordSubTitleArray[index],
                                  style: TextStyle(color: kWhiteColor),
                                ),
                              ),
                            );
                          })),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //page view session
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: PageView.builder(
                        itemCount: 5,
                        controller: pageController,
                        onPageChanged: (value) {},
                        itemBuilder: ((context, index) {
                          return Container(
                            color: kDarkGrayColor,
                          );
                        })),
                  ),
                  Positioned(right: 0,child: Padding(
                    padding: const EdgeInsets.only(right: 32,top: 12),
                    child: Image.asset(kHeartBorderLogo,width: 24,height: 24,),
                  ))
                ],
              )),
              const SizedBox(
                height: 10,
              ),
              SmoothPageIndicator(
                  controller: pageController, // PageController
                  count: 5,
                  effect: ExpandingDotsEffect(
                      activeDotColor: kSecondaryColor,
                      dotColor: kDarkGrayColor,
                      dotHeight: 5,
                      dotWidth: 5,
                      spacing: 4), // your preferred effect
                  onDotClicked: (index) {}),
              const SizedBox(
                height: 19,
              ),

              //final session
              Row(
                children: [
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    height: 69,
                    width: 69,
                    color: kDarkGrayColor,
                    child: Center(
                      child: Text(
                        'Hand illustration',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style:
                            TextStyle(color: kWhiteColor, fontSize: kTextSmall),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ));
  }
}
