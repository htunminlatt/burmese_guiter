import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';

class ArtistUiView extends StatelessWidget {
  const ArtistUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: kAppBarColor),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    kGuiterBackgroundLogo,
                    width: 64,
                    height: 64,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10,),
                Text(
                  'Hlawn Paing',
                  style: TextStyle(fontSize: kTextRegular2x, color: kWhiteColor,fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
          ),
          Positioned(
            right: 0,
              child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    kHeartfilLogo,
                    width: 24,
                    height: 24,
                  )))
        ],
      ),
    );
  }
}
