import 'package:burmese_guiter/screen/user/account_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:burmese_guiter/widgets/cache_image_url.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: customAppBar('Account', context,true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 22,),
          ClipOval(
            child: cacheImage(
                'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=1605',
                100.0,
                100.0),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'Hlawn Paing',
            style: TextStyle(fontSize: kTextRegular3x, color: kWhiteColor),
          ),
          const SizedBox(
            height: 33,
          ),
          Container(
            height: 215,
            margin:const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: kAppBarColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                InkWell(onTap: () {
                  PageNavigator(ctx: context).nextPage(page:  const AccountScreen());
                },child: accountUiView('Account', Icons.person)),
                const SizedBox(height: 5,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: kDarkGrayColor,
                ),
                accountUiView('Password', Icons.key),
                const SizedBox(height: 5,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: kDarkGrayColor,
                ),
                accountUiView('Language', Icons.language),
                const SizedBox(height: 5,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 1,
                  color: kDarkGrayColor,
                ),
                accountUiView('Downloads', Icons.download),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox accountUiView(String title, IconData icon) {
    return SizedBox(
      height: 48,
      child: ListTile(
        leading: Icon(
          icon,
          color: kWhiteColor,
        ),
        title: Text(
          title,
          style: TextStyle(color: kWhiteColor),
        ),
        trailing: Icon(
          Icons.arrow_forward,
          color: kWhiteColor,
          size: 18,
        ),
      ),
    );
  }
}
