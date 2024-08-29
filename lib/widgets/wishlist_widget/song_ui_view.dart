import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SongUiView extends StatelessWidget {
  const SongUiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 64,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              kSongIcon,
              width: 24,
              height: 24,
              color: kWhiteColor,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Song Name',
                  style: TextStyle(color: kWhiteColor, fontSize: kTextRegular),
                ),
                Text(
                  'Artist',
                  style: TextStyle(color: kWhiteColor, fontSize: kTextxSmall),
                )
              ],
            ),
            const Spacer(),
            Image.asset(
              kHeartfilLogo,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
