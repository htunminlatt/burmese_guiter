import 'package:burmese_guiter/widgets/courses_widgets/free_tutorial_ui_view.dart';
import 'package:flutter/material.dart';

class WishlistTutorialView extends StatelessWidget {
  const WishlistTutorialView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 20,),
        itemCount: 2,
        itemBuilder: ((context, index) {
          return const FreetutorialUiview();
        }));
  }
}