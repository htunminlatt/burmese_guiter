import 'package:burmese_guiter/screen/chord/ranking_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:burmese_guiter/widgets/wishlist_widget/album_ui_view.dart';
import 'package:flutter/material.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: customAppBar('Album', context, false),
      body: GridView.builder(
        padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 21,
              crossAxisSpacing: 21,
              mainAxisExtent: 130),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                PageNavigator(ctx: context).nextPage(page: const RankingScreen(title: 'Album Name',));
              },
              child: const AlbumUiView(),
            );
          }),
    );
  }
}