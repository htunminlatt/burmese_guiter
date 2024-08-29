import 'package:burmese_guiter/screen/home/noti_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(String title, BuildContext context,bool isShowNotiIcon) {
  return AppBar(
    backgroundColor: kAppBarColor,
    centerTitle: false,
    surfaceTintColor: kAppBarColor,
    title: Text(
      title,
      style: TextStyle(color: kWhiteColor),
    ),
    actions: [
      Visibility(
        visible: isShowNotiIcon,
        child: IconButton(
            onPressed: () {
              PageNavigator(ctx: context)
                  .nextPage(page: const NotificationScreen());
            },
            icon: Icon(
              Icons.notifications,
              color: kWhiteColor,
            )),
      )
    ],
  );
}
