import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:burmese_guiter/firebase_options.dart';
import 'package:burmese_guiter/network/home/home_cubit.dart';
import 'package:burmese_guiter/network/login/auth_login_cubit.dart';
import 'package:burmese_guiter/network/network/network_cubit.dart';
import 'package:burmese_guiter/network/signup/sign_up_cubit.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:burmese_guiter/screen/auth/splash.dart';
import 'package:burmese_guiter/screen/home/noti_screen.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }  {
   await Firebase.initializeApp();
  }
  
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noOverlay,
          activeTrackColor: kPrimaryColor,
          inactiveTrackColor: kDarkGrayColor,
          rangeTrackShape: const RoundedRectRangeSliderTrackShape(),
          trackHeight: 3.0,
        ),
      
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (BuildContext context) => Image.asset(
            kBackLogo,
            color: kWhiteColor,
            width: 25,
            height: 25,
          ),
        ),
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, primary: Colors.white),
        useMaterial3: true,
      ),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: '/',
      routes: {
        '/noti_screen' : (context) => const NotificationScreen(),
      },
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AuthLoginCubit>(
              create: (context) => AuthLoginCubit(AppRepository())),
          BlocProvider<SignUpCubit>(
              create: (context) => SignUpCubit(AppRepository())),
          BlocProvider<NetworkCubit>(
            create: (context) => NetworkCubit(),
          ),
          BlocProvider<HomeCubit>(
              create: (context) => HomeCubit(AppRepository())),
        ],
        child: const Splash(),
      ),
    );
  }
}
