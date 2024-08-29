import 'package:burmese_guiter/widgets/courses_widgets/course_unfinish_view.dart';
import 'package:flutter/material.dart';

class MyCourseScreenView extends StatelessWidget {
  const MyCourseScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
            child: CourseUnfinishUiView(),
          ),
        ],
      ),
    );
  }
}

