
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class PageNavigator {

  BuildContext? ctx;
  PageNavigator({required this.ctx});

  //navigate to next page
  Future nextPage({Widget? page}){
   return PersistentNavBarNavigator.pushNewScreen(
        ctx!,
        screen: page!,
        withNavBar: false, // OPTIONAL VALUE. True by default.
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
    // return Navigator.push(ctx!, MaterialPageRoute(builder: ((context) => page!)));
  }

  void nextPageOnly({Widget? page}){
    Navigator.pushAndRemoveUntil(ctx!, MaterialPageRoute(builder: ((context) => page!)), (route) => false);
  }
}