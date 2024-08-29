import 'package:burmese_guiter/screen/chord/album_screen.dart';
import 'package:burmese_guiter/screen/chord/artist_screen.dart';
import 'package:burmese_guiter/screen/chord/chord_library_screen.dart';
import 'package:burmese_guiter/screen/chord/song_screen.dart';
import 'package:burmese_guiter/screen/chord/top_song_screen.dart';
import 'package:burmese_guiter/screen/home/search_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ChordScreen extends StatelessWidget {
  const ChordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titleArray = [
      'Songs',
      'Artists',
      'Album',
      'Top Songs',
      'Chord Library'
    ];
    List<String> titleImageArray = [
      kSongIcon,
      kArtistIcon,
      kAlbumIcon,
      kTogSongIcon,
      kChordLogo
    ];

    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: customAppBar('Chord', context, true),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),

          //search view
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 45,
            decoration: BoxDecoration(
                color: kDark2Color, borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      readOnly: true,
                      style: TextStyle(color: kWhiteColor),
                      onTap: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const SearchScreen());
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search chord',
                          hintStyle: TextStyle(color: kDarkGrayColor)),
                    ),
                  ),
                  Image.asset(
                    kSearchLogo,
                    width: 20,
                    height: 20,
                    color: kDarkGrayColor,
                  )
                ],
              ),
            ),
          ),
          //courses
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 100),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          PageNavigator(ctx: context)
                              .nextPage(page: const SongScreen());
                          break;
                        case 1:
                          PageNavigator(ctx: context)
                              .nextPage(page: const ArtistScreen());
                        case 2:
                          PageNavigator(ctx: context)
                              .nextPage(page: const AlbumScreen());
                        case 3:
                          PageNavigator(ctx: context)
                              .nextPage(page: const TopSongScreen());
                        case 4:
                          PageNavigator(ctx: context)
                              .nextPage(page: const ChordLibraryScreen());
                        default:
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            titleImageArray[index],
                            width: 24,
                            height: 24,
                            color: kSecondaryColor,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            titleArray[index],
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: kTextSize14, color: kSecondaryColor),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
