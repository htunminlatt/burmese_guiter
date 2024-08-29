import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 64),
      child: InkWell(
        onTap: onPressed,
        child: Image.asset(
          kBackLogo,
          color: kWhiteColor,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
