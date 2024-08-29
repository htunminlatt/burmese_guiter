import 'package:burmese_guiter/screen/courses/free_tutorial_detail_screen.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/widgets/courses_widgets/free_tutorial_ui_view.dart';
import 'package:flutter/material.dart';

class FreeTutorialScreenView extends StatelessWidget {
  const FreeTutorialScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20,),
        itemCount: 10,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              PageNavigator(ctx: context).nextPage(page: const FreeTutorialDetailScreen());
            },
            child: const FreetutorialUiview());
        }));
  }
}
