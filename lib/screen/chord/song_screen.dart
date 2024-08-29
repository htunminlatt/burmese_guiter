import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:burmese_guiter/widgets/wishlist_widget/song_ui_view.dart';
import 'package:flutter/material.dart';

class SongScreen extends StatelessWidget {
  const SongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Songs', context, false),
      backgroundColor: kDarkColor,
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Column(
              children: [
                const SongUiView(),
                Divider(
                  color: kDarkGrayColor,
                  thickness: 0.5,
                )
              ],
            );
          })),
    );
  }
}
