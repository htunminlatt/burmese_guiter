import 'package:burmese_guiter/widgets/course_view.dart';
import 'package:flutter/material.dart';

class WishlistCourseView extends StatelessWidget {
  const WishlistCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 21,
            crossAxisSpacing: 21,
            mainAxisExtent: 279),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: const CourseView(enrollOrNot: false,),
          );
        });
  }
}
