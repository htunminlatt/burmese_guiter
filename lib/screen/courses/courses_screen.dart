import 'package:burmese_guiter/screen/courses/free_tutorial_screen.dart';
import 'package:burmese_guiter/screen/courses/my_course_screen.dart';
import 'package:burmese_guiter/screen/home/noti_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

 TabBar get _tabBar => TabBar(
                padding: const EdgeInsets.only(left: 20,bottom: 10,top: 15),
                labelPadding: const EdgeInsets.only(bottom: 10, right: 20),
                isScrollable: true,
                dividerColor: kDarkGrayColor,
                tabAlignment: TabAlignment.start,
                labelColor: kWhiteColor,
                unselectedLabelColor: kDarkGrayColor,
                tabs: const [Text('My Courses'), Text('Free Tutorials')]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kDarkColor,
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          centerTitle: false,
          toolbarHeight: 64,
          surfaceTintColor: kAppBarColor,
          title: Text(
            'My Courses',
            style: TextStyle(color: kWhiteColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  PageNavigator(ctx: context)
                      .nextPage(page: const NotificationScreen());
                },
                icon: Icon(
                  Icons.notifications,
                  color: kWhiteColor,
                ))
          ],
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(color: kDarkColor,
            child: _tabBar),
          ),
        ),
        body: const TabBarView(
            children: [MyCourseScreenView(), FreeTutorialScreenView()]),
      ),
    );
  }
}
