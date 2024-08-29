import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/widgets/carousel_view.dart';
import 'package:flutter/material.dart';

class FreeTutorialDetailScreen extends StatelessWidget {
  const FreeTutorialDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        foregroundColor: kWhiteColor,
        backgroundColor: kAppBarColor,
        surfaceTintColor: kAppBarColor,
        title: const Text('Free Tutorial Detail'),
        centerTitle: false,
        actions: [
          Icon(Icons.download,color: kWhiteColor,size: 24,),
          const SizedBox(width: 10,),
          Image.asset(kHeartBorderLogo,width: 24,height: 24,),
          const SizedBox(width: 20,),
        ],
      ),
      body:const Column(
        children: [
          CarouselViewWidget(isShowIndicator: true,),           
        ],
      ),
    );
  }
}
