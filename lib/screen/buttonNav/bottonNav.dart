import 'dart:async';

import 'package:burmese_guiter/screen/chord/chord_screen.dart';
import 'package:burmese_guiter/screen/courses/courses_screen.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_screen.dart';
import 'package:burmese_guiter/screen/home/home_screen.dart';
import 'package:burmese_guiter/screen/user/user_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:rxdart_ext/single.dart';


StreamController<int> indexController = BehaviorSubject<int>();

class BottonNavScreen extends StatelessWidget {
  const BottonNavScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    final List<Widget> _buildScreens = [
      const HomeScreen(),
      const ChordScreen(),
      const CoursesScreen(),
      const WishlistScreen(),
      const UserScreen()
    ];

    _controller = PersistentTabController(initialIndex: 0);

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: StreamBuilder(
            stream: indexController.stream,
            builder: (context, snapshot) {
              return Image.asset(
                kHomeLogo,
                width: 25,
                height: 25,
                color: snapshot.data == 0 || snapshot.data == null ? kPrimaryColor : kWhiteColor,
              );
            }
          ),
          title: (""),
          activeColorPrimary: kPrimaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: StreamBuilder(
            stream: indexController.stream,
            builder: (context, snapshot) {
              return Image.asset(
                kChordLogo,
                width: 25,
                height: 25,
                color: snapshot.data == 1 ? kPrimaryColor : kWhiteColor,
              );
            }
          ),
          title: (""),
          activeColorPrimary: kPrimaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: StreamBuilder<Object>(
            stream: indexController.stream,
            builder: (context, snapshot) {
              return Image.asset(
                kCourseLogo,
                width: 25,
                height: 25,
                color: snapshot.data == 2 ? kPrimaryColor : kWhiteColor,
              );
            }
          ),
          title: (""),
          activeColorPrimary: kPrimaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: StreamBuilder(
            stream: indexController.stream,
            builder: (context, snapshot) {
              return Image.asset(
                kHeartfilLogo,
                width: 25,
                height: 25,
                color: snapshot.data == 3 ? kPrimaryColor : kWhiteColor,
              );
            }
          ),
          title: (""),
          activeColorPrimary: kPrimaryColor,
        ),
        PersistentBottomNavBarItem(
          icon: StreamBuilder(
            stream: indexController.stream,
            builder: (context, snapshot) {
              return Image.asset(
                kUserLogo,
                width: 25,
                height: 25,
                color: snapshot.data == 4 ? kPrimaryColor : kWhiteColor,
              );
            }
          ),
          title: (""),
          activeColorPrimary: kPrimaryColor,
        ),
      ];
    }

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens,
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: kAppBarColor, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      onItemSelected: (value) {
        indexController.sink.add(value);
      },

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}
