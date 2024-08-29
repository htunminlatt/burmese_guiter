import 'package:burmese_guiter/uitils/colors.dart';
import 'package:flutter/material.dart';

class WishlistChordView extends StatelessWidget {
  const WishlistChordView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> array = ['b', 'C', 'Major', 'Gmajor7'];

    return ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Container(
            padding: const EdgeInsets.only(top: 5),
            color: kAppBarColor,
            height: 64,
            child: ListTile(
              leading: SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: ListView.builder(
                  itemCount: array.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return index == array.length - 1
                        ? Center(
                            child: Text(
                              '....',
                              style: TextStyle(
                                color: kWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Chip(
                                elevation: 0,
                                side: BorderSide(color: kAppBarColor),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: array[index] == 'b'
                                    ? kDarkColor
                                    : kPrimaryColor,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                label: Text(
                                  array[index],
                                  style: TextStyle(
                                      color: kWhiteColor,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: array[index] == 'b'
                                          ? FontStyle.italic
                                          : FontStyle.normal),
                                )),
                          );
                  },
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: kWhiteColor,
              ),
            ),
          );
        }));
  }
}
