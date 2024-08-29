import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/carousel_view.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppBarColor,
      appBar: customAppBar('Course detail', context, false),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                color: kDarkColor,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //carousel view
                      const CarouselViewWidget(isShowIndicator: true,),

                      const SizedBox(
                        height: 40,
                      ),

                      //price view
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Guiter',
                              style: TextStyle(
                                  fontSize: kTextSize14,
                                  color: kSecondaryColor),
                            ),

                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Basic guiter course by**',
                                  style: TextStyle(
                                      fontSize: kTextRegular3x,
                                      color: kWhiteColor),
                                ),
                                Image.asset(
                                  kHeartBorderLogo,
                                  width: 24,
                                  height: 24,
                                )
                              ],
                            ),

                            //
                            Text(
                              '30000 MMK',
                              style: TextStyle(
                                  color: kTextColor, fontSize: kTextSize24),
                            ),

                            //
                            const SizedBox(
                              height: 6,
                            ),
                            //
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'This course include 11 persons his course include 11 persons',
                                    overflow: TextOverflow.ellipsis,
                                    // maxLines: 2,
                                    style: TextStyle(
                                        fontSize: kTextSmall,
                                        color: kWhiteColor),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.people,
                                        size: 16,
                                        color: kWhiteColor,
                                      ),
                                      Text(
                                        '500 people enrolled',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: kTextSmall,
                                            color: kWhiteColor),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            //divider
                            Container(
                              height: 1,
                              color: kDarkGrayColor,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //instructor name session
                            SizedBox(
                              height: 80,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: kSecondaryColor),
                                        shape: BoxShape.circle),
                                    child: ClipOval(
                                        child: Image.asset(
                                      kCarouselImage,
                                      fit: BoxFit.cover,
                                    )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Instructor Name',
                                              style: TextStyle(
                                                  fontSize: kTextRegular3x,
                                                  color: kWhiteColor),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                              color: kWhiteColor,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          // width: MediaQuery.of(context).size.width/2,
                                          child: Text(
                                            'Qorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                                fontSize: kTextSmall,
                                                color: kWhiteColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //divider
                            Container(
                              height: 1,
                              color: kDarkGrayColor,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //description session
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: kTextRegular3x, color: kWhiteColor),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Korem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus.  ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus ',
                              style: TextStyle(
                                  fontSize: kTextRegular, color: kWhiteColor),
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //divider
                            Container(
                              height: 1,
                              color: kDarkGrayColor,
                            ),

                            const SizedBox(
                              height: 20,
                            ),
                            //Syllabus session
                            Text(
                              'Syllabus: What you will learn',
                              style: TextStyle(
                                  fontSize: kTextRegular3x, color: kWhiteColor),
                            ),

                            SizedBox(
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
                                            leading: Text('${index+1}',style: TextStyle(color: kWhiteColor),),
                                            title: Text('Course context',
                                                style: TextStyle(
                                                  color: kWhiteColor,
                                                )),
                                                children: [
                                                  ListTile(title: Text('This is course ... This is course ... This is course ... This is course ...This is course ...This is course ...This is course ...This is course ...',style: TextStyle(color: kWhiteColor),),)
                                                ],
                                                ),
                                                Container(height: 0.2,color: kWhiteColor,)
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
                    ],
                  ),
                ),
              ),
            ),

            //enroll session
            Container(
              height: 111,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: kAppBarColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(color: kWhiteColor),
                      ),
                      Text(
                        '300000Ks',
                        style: TextStyle(color: kTextColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: kWhiteColor,
                    thickness: 1,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text('Enroll Now'),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
