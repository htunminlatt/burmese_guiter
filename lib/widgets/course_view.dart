import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseView extends StatelessWidget {
  const CourseView({
    super.key,
    required this.enrollOrNot,
  });

  final bool enrollOrNot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 231,
      decoration: BoxDecoration(
          color: kAppBarColor, borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      child: Image.asset(
                        kCarouselImage,
                        fit: BoxFit.fill,
                      ))),
              Container(
                height: 120,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                color: kAppBarColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Beginner guiter courses',
                      style: TextStyle(
                          fontSize: kTextRegular,
                          color: kWhiteColor,
                          overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Visibility(
                      visible: enrollOrNot == false,
                      child: const Text(
                        '30,000 MMK',
                        style: TextStyle(
                            color: Colors.red, fontSize: kTextRegular2x),
                      ),
                    ),
                    Visibility(
                        visible: enrollOrNot == true,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kSecondaryColor),
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(12),
                          backgroundColor: kWhiteColor3,
                        )),
                    Divider(
                      color: kDarkGrayColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          color: kWhiteColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            '1000 people enrolled',
                            style: TextStyle(
                              fontSize: kTextSmall,
                              color: kWhiteColor,
                            ),
                            softWrap: true,
                            maxLines: 2,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              right: 5,
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    kHeartBorderLogo,
                    color: kWhiteColor,
                    width: 24,
                    height: 24,
                  ))),
        ],
      ),
    );
  }
}
