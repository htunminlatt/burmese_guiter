import 'package:burmese_guiter/screen/auth/login_screen.dart';
import 'package:burmese_guiter/screen/auth/sign_up_screen.dart';
import 'package:burmese_guiter/screen/buttonNav/bottonNav.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/uitils/text.dart';
import 'package:burmese_guiter/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
          body: Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(kGuiterBackgroundLogo),
          fit: BoxFit.cover),
    ),
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(kGradientBackground),
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 96),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      kGuiterLogo,
                      width: 182,
                      height: 182,
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    CustomText()
                        .customText(kTextSize28, kWhiteColor, 'Welcome to'),
                    CustomText().customText(
                        kTextRegular3x, kPrimaryColor, 'Burmese Guita:'),
                    CustomText().customText(kTextRegular3x, kWhiteColor,
                        'musical learning app'),
                    const SizedBox(
                      height: kMarginMedium2,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CustomText().customText(
                          kTextRegular2x,
                          kWhiteColor,
                          'We are Burmese Gita. The learning app which will let you learn various music instruments step by step with tutorials and courses.'),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
    
                    //login
                    CustomButton(
                      isFill: true,
                      onPress: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const LoginScreen());
                      },
                      label: 'Login',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
    
                    //sing up
                    CustomButton(
                      isFill: false,
                      onPress: () {
                        PageNavigator(ctx: context)
                            .nextPage(page: const SignUpScreen());
                      },
                      label: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ),

          InkWell(
            onTap: () {
              PageNavigator(ctx: context).nextPageOnly(page: const BottonNavScreen());
            },
            child: CustomText()
              .customText(kTextRegular2x, kWhiteColor, 'continue as guest'),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    ),
          ),
        );
  }
}
