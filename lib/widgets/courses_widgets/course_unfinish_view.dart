import 'package:burmese_guiter/screen/courses/enrolled_course_detail_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/widgets/course_view.dart';
import 'package:flutter/material.dart';

class CourseUnfinishUiView extends StatelessWidget {
  const CourseUnfinishUiView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: (4 * 64) + 40,
          decoration: BoxDecoration(
              color: kDark2Color, borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text('Courses you\'re about to finish',
                  overflow: TextOverflow.ellipsis,
                  style:
                      TextStyle(color: kWhiteColor, fontSize: kTextRegular3x)),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        PageNavigator(ctx: context).nextPage(page: const EnrollCourseDetailScreen());
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        height: 64,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 64,
                              height: 64,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(
                                      12,
                                    ),
                                    bottomLeft: Radius.circular(
                                      12,
                                    )),
                                child: Image.asset(
                                  kCarouselImage,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: kDarkColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(
                                        12,
                                      ),
                                      bottomRight: Radius.circular(
                                        12,
                                      ))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                              'Beginner Guiter by Courses',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: kTextRegular2x,
                                                color: kWhiteColor,
                                              ))),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                        'Contiune',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: kDarkGrayColor,
                                            fontSize: kTextxSmall),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 9,
                                  ),
                                  LinearProgressIndicator(
                                    value: 0.5,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        kSecondaryColor),
                                    minHeight: 12,
                                    borderRadius: BorderRadius.circular(12),
                                    backgroundColor: kWhiteColor3,
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    );
                  }))
           ],
         ),
        ),
        const SizedBox(height: 20,),
        
        GridView.builder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 21,
                crossAxisSpacing: 21,
                mainAxisExtent: 279),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: const CourseView(enrollOrNot: true,),
              );
            }),
            const SizedBox(height: 20,),
      ],
    );
  }
}
