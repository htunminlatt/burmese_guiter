import 'package:burmese_guiter/network/Login/auth_login_cubit.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:burmese_guiter/screen/auth/sign_up_screen.dart';
import 'package:burmese_guiter/screen/buttonNav/bottonNav.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/uitils/secure_storage.dart';
import 'package:burmese_guiter/uitils/text.dart';
import 'package:burmese_guiter/uitils/validation_check.dart';
import 'package:burmese_guiter/widgets/app_loading.dart';
import 'package:burmese_guiter/widgets/custom_alert.dart';
import 'package:burmese_guiter/widgets/custom_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isCheck = false;
  String type = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthLoginCubit(AppRepository()),
      child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
              backgroundColor: kDarkColor,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.transparent,
                foregroundColor: kWhiteColor,
              ),
              extendBodyBehindAppBar: true,
              body: BlocConsumer<AuthLoginCubit, AuthLoginState>(
                listener: (context, state) {
                  
                  if (state is LoginSuccessState) {
                    Future.delayed(
                        Duration.zero,
                        () => PageNavigator(ctx: context)
                            .nextPageOnly(page: const BottonNavScreen()));
                  }

                   if (state is FailState) {
                   hideLoading(context);
                    Future.delayed(
                        Duration.zero,
                        () => showCustomAlertDialog(
                            context, state.error, CoolAlertType.error));
                  }
                },
                builder: (context, state) {
                  return Container(
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
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 96),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image.asset(
                                    kGuiterLogo,
                                    width: 182,
                                    height: 182,
                                  ),
                                ),

                                const SizedBox(
                                  height: 50,
                                ),
                                CustomText().customText(
                                    kTextSize28, kWhiteColor, 'Login'),
                                const SizedBox(
                                  height: 24,
                                ),

                                //text field
                                inputForm(phoneEmailController, 'Phone/Email'),
                                const SizedBox(
                                  height: 16,
                                ),
                                inputForm(passwordController, 'Password'),

                                //fotgot password
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Forgot password?',
                                          style: TextStyle(color: Colors.red),
                                        )),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              isCheck = !isCheck;

                                              if (isCheck == true) {
                                                SecureStorage()
                                                    .saveAuthStatus('login');
                                              } else {
                                                SecureStorage()
                                                    .saveAuthStatus('');
                                              }
                                            });
                                          },
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: kWhiteColor),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: isCheck
                                                ? Center(
                                                    child: Icon(
                                                    Icons.check,
                                                    color: kWhiteColor,
                                                    size: 17,
                                                  ))
                                                : const Text(''),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Remember me',
                                          style: TextStyle(
                                              color: kWhiteColor, fontSize: 12),
                                        )
                                      ],
                                    )
                                  ],
                                ),

                                const SizedBox(
                                  height: 16,
                                ),
                                //button
                                CustomButton(
                                  isFill: true,
                                  onPress: () {
                                    if (phoneEmailController.text.isEmpty ||
                                        passwordController.text.isEmpty) {
                                      showCustomAlertDialog(
                                          context,
                                          'Empty fields!',
                                          CoolAlertType.warning);
                                    } else if (!validateEmail(
                                            phoneEmailController.text) &&
                                        !validatePhoneNumber(
                                            phoneEmailController.text)) {
                                      showCustomAlertDialog(context,
                                          'Please input correct email or phone number!',CoolAlertType.warning);
                                    } else {
                                      if (validateEmail(
                                          phoneEmailController.text)) {
                                        type = 'email';
                                      } else {
                                        type = 'phone';
                                      }
                                      showLoading(context);
                                      context.read<AuthLoginCubit>().loginUser(
                                          phoneEmailController.text,
                                          passwordController.text,
                                          type);
                                      
                                    }
                                  },
                                  label: 'Login',
                                ),
                                const SizedBox(
                                  height: 8,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText().customText(
                                        kTextSmall,
                                        kDarkGrayColor,
                                        'Don\'t have an account?'),
                                    TextButton(
                                        onPressed: () {
                                          PageNavigator(ctx: context).nextPage(
                                              page: const SignUpScreen());
                                        },
                                        child: Text(
                                          'Sign Up Here',
                                          style: TextStyle(
                                              color: kLightBlueColor,
                                              fontSize: 12),
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ))),
    );
  }
}

Widget inputForm(TextEditingController controller, String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    height: 52,
    decoration: BoxDecoration(
        color: kDark2Color, borderRadius: BorderRadius.circular(12)),
    child: TextField(
      controller: controller,
      style: TextStyle(color: kWhiteColor),
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyle(color: kWhiteColor, fontSize: 16)),
    ),
  );
}
