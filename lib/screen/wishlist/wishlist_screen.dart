import 'package:burmese_guiter/screen/home/noti_screen.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_album_view.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_artist_view.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_chord_view.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_free_tutorial_view.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_song_view.dart';
import 'package:burmese_guiter/screen/wishlist/wishlist_course_view.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

List<String> titleArray = ['', '', '', '', '', ''];

TabBar get _tabBar => TabBar(
        padding: const EdgeInsets.only(left: 20, bottom: 10, top: 15),
        labelPadding: const EdgeInsets.only(bottom: 10, right: 20),
        isScrollable: true,
        dividerColor: kDarkGrayColor,
        tabAlignment: TabAlignment.start,
        labelColor: kWhiteColor,
        unselectedLabelColor: kDarkGrayColor,
        tabs: const [
          Text('Courses'),
          Text('Songs'),
          Text('Album'),
          Text('Chord'),
          Text('Artist'),
          Text('Free Turorials')
        ]);

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: titleArray.length,
      child: Scaffold(
        backgroundColor: kDarkColor,
        appBar: AppBar(
          backgroundColor: kAppBarColor,
          centerTitle: false,
          surfaceTintColor: kAppBarColor,
          toolbarHeight: 64,
          title: Text(
            'Wishlist',
            style: TextStyle(color: kWhiteColor),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  PageNavigator(ctx: context)
                      .nextPage(page: const NotificationScreen());
                },
                icon: Icon(
                  Icons.notifications,
                  color: kWhiteColor,
                ))
          ],
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(color: kDarkColor, child: _tabBar),
          ),
        ),
        body: const TabBarView(children: [
          WishlistCourseView(),
          WishlistSongView(),
          WishlistAlbumView(),
          WishlistChordView(),
          WishlistArtistView(),
          WishlistTutorialView()
        ]),
      ),
    );
  }
}
