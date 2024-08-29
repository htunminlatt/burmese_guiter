import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';

import '../../widgets/carousel_view.dart';

class CourseContentDetailScreen extends StatelessWidget {
  const CourseContentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        foregroundColor: kWhiteColor,
        backgroundColor: kAppBarColor,
        surfaceTintColor: kAppBarColor,
        title: const Text('Course Content Detail'),
        centerTitle: false,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                shape: BoxShape.circle, border: Border.all(color: kWhiteColor)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CarouselViewWidget(isShowIndicator: true,),
            const SizedBox(
              height: 16,
            ),
        
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 20,
                    width: 88,
                    child: Image.asset(
                      kPreviousLogo,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 56,
                    child: Image.asset(
                      kNextLogo,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16,),
            //session
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        ExpansionTile(
                          shape: Border.all(color: kDarkColor),
                          iconColor: kPrimaryColor,
                          collapsedIconColor: kPrimaryColor,
                          leading: Text(
                            '${index + 1}',
                            style: TextStyle(color: kWhiteColor),
                          ),
                          title: Text('Course context',
                              style: TextStyle(
                                color: kWhiteColor,
                              )),
                          children: [
                            ListTile(
                              title: Text(
                                'This is course',
                                style: TextStyle(color: kWhiteColor),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 0.2,
                          color: kWhiteColor,
                        )
                      ],
                    );
                  })),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
