import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';

class AlbumUiView extends StatelessWidget {
  const AlbumUiView({super.key});

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
                Image.asset(
                  kAlbumIcon,
                  color: kWhiteColor,
                  width: 40,
                  height: 40,
                ),
                const SizedBox(height: 10,),
                Text(
                  'Album name',
                  style: TextStyle(fontSize: kTextRegular2x, color: kWhiteColor),
                ),
                Text(
                  'Artist name',
                  style: TextStyle(fontSize: kTextxSmall, color: kWhiteColor),
                )
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
