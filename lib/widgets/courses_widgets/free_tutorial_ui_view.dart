import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:flutter/material.dart';

class FreetutorialUiview extends StatelessWidget {
  const FreetutorialUiview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.fromLTRB(20, 0, 20, 20),
      height: 140,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: SizedBox(
                height: 140,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        12,
                      ),
                      bottomLeft: Radius.circular(
                        12,
                      )),
                  child: Image.asset(
                    kCarouselImage,
                    fit: BoxFit.cover,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: kAppBarColor,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(
                            12,
                          ),
                          bottomRight: Radius.circular(
                            12,
                          )),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(
                            maxLines: 2,
                            'Burmese Guiter Course by ***',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: kWhiteColor,
                                fontSize: kTextRegular2x),
                          ),
                        ),
                        Text(
                          'Instructor name',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: kSecondaryColor,
                              fontSize: kTextRegular),
                        ),
                        Text(
                          maxLines: 3,
                          'This course is for people who is start learning for guiter.',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: kWhiteColor,
                              fontSize: kTextxSmall),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            kHeartBorderLogo,
                            width: 24,
                            height: 24,
                          )))
                ],
              )),
        ],
      ),
    );
  }
}
