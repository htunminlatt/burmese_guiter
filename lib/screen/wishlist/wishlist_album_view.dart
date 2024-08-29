import 'package:burmese_guiter/widgets/wishlist_widget/album_ui_view.dart';
import 'package:flutter/material.dart';

class WishlistAlbumView extends StatelessWidget {
  const WishlistAlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 21,
            crossAxisSpacing: 21,
            mainAxisExtent: 130),
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: const AlbumUiView(),
          );
        });
  }
}