import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.isFill, required this.onPress, required this.label});
  final bool isFill;
  final VoidCallback onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 30,
        decoration: BoxDecoration(
          color: isFill ? kWhiteColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isFill ? Border.all(color: Colors.transparent) : Border.all(color: kWhiteColor)
        ),
        child: Center(
          child: isFill ? CustomText().customText(kTextRegular2x,kDarkColor, label) : CustomText().customText(kTextRegular2x,kWhiteColor, label),
        )
        ,
      ),
    );
  }
}