import 'package:burmese_guiter/uitils/colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget appLoadingWidget() {
  return Center(
    child: LoadingAnimationWidget.inkDrop(
        color: kSecondaryColor, size: 30),
  );
}

showLoading(BuildContext context){
  showDialog(barrierDismissible: false,context: context, builder: ((context) {
    return Center(child: CircularProgressIndicator(color: kSecondaryColor,),);
  }));
}

hideLoading(BuildContext context){
  Navigator.pop(context);
}