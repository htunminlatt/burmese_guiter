import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/widgets/appbar.dart';
import 'package:burmese_guiter/widgets/wishlist_widget/song_ui_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ArtistDetailScreen extends StatefulWidget {
  const ArtistDetailScreen({super.key});

  @override
  State<ArtistDetailScreen> createState() => _ArtistDetailScreenState();
}

class _ArtistDetailScreenState extends State<ArtistDetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: customAppBar('Artists', context, false),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  kGuiterBackgroundLogo,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Hlawn Paing',
                style: TextStyle(
                    fontSize: kTextRegular2x,
                    color: kWhiteColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          //Albums session
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Albums',
                      style: TextStyle(
                          fontSize: kTextRegular3x,
                          color: kWhiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 24,
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: _selectedIndex == index
                                      ? kSecondaryColor
                                      : Colors.transparent,
                                  border: Border.all(
                                      color: _selectedIndex == index
                                          ? Colors.transparent
                                          : kDarkGrayColor),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  'Album name',
                                  style: TextStyle(
                                      fontSize: kTextRegular,
                                      color: _selectedIndex == index
                                          ? kDarkColor
                                          : kDarkGrayColor),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
          )
        ],
      ),
    );
  }
}
