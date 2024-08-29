import 'package:burmese_guiter/screen/chord/ranking_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:flutter/material.dart';

class TopSongScreen extends StatelessWidget {
  const TopSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titleArray = [
      'Today\'s Ranking',
      'Weekly Ranking',
      'Monthly Ranking'
    ];

    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: customAppBar('Top Songs', context, false),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: titleArray
                .map((e) => Container(
                      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kAppBarColor),
                      child: Column(
                        children: [
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 20),
                            child: InkWell(
                              onTap: () {
                                PageNavigator(ctx: context).nextPage(page: const RankingScreen(title: 'Ranking',));
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    kCrownLogo,
                                    width: 32,
                                    height: 32,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    e,
                                    style: TextStyle(
                                        color: kWhiteColor, fontSize: kTextRegular2x),
                                  ),
                                  const Spacer(),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: kWhiteColor,
                                    size: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(height: 0.5,color: kDarkGrayColor,),
                          const SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListView.builder(
                              padding:const EdgeInsets.only(),
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                                itemCount: 5,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '$index',
                                          style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: kTextRegular2x),
                                        ),
                                        Text(
                                          'song name',
                                          style: TextStyle(
                                              color: kWhiteColor,
                                              fontSize: kTextRegular2x),
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: kWhiteColor,
                                          size: 16,
                                        )
                                      ],
                                    ),
                                  );
                                })),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
