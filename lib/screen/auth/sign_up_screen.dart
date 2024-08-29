import 'package:burmese_guiter/network/signup/sign_up_cubit.dart';
import 'package:burmese_guiter/repository/app_repository.dart';
import 'package:burmese_guiter/screen/auth/login_screen.dart';
import 'package:burmese_guiter/screen/buttonNav/bottonNav.dart';
import 'package:burmese_guiter/uitils/colors.dart';
import 'package:burmese_guiter/uitils/dimentions.dart';
import 'package:burmese_guiter/uitils/images.dart';
import 'package:burmese_guiter/uitils/routes/router.dart';
import 'package:burmese_guiter/uitils/secure_storage.dart';
import 'package:burmese_guiter/uitils/text.dart';
import 'package:burmese_guiter/uitils/validation_check.dart';
import 'package:burmese_guiter/widgets/custom_alert.dart';
import 'package:burmese_guiter/widgets/custom_button.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isCheck = false;
  String type = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: ((context) => SignUpCubit(AppRepository())),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            foregroundColor: kWhiteColor,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          extendBodyBehindAppBar: true,
          // resizeToAvoidBottomInset: false,
          body: BlocBuilder<SignUpCubit, SignUpState>(
            builder: (context, state) {
              if (state is FailSignUpState) {
                Future.delayed(
                    Duration.zero,
                    () => showCustomAlertDialog(
                        context, state.message, CoolAlertType.error));
              }

              if (state is SuccessState) {
                Future.delayed(
                    Duration.zero,
                    () => PageNavigator(ctx: context)
                        .nextPageOnly(page: const BottonNavScreen()));
              }
              return Container(
                width: double.infinity,
                height: double.infinity,
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
                        CustomText()
                            .customText(kTextSize28, kWhiteColor, 'Sign Up'),
                        const SizedBox(
                          height: 24,
                        ),
                        //name
                        inputForm(nameController, 'Name'),
                        const SizedBox(
                          height: 16,
                        ),
                        //text field
                        inputForm(phoneEmailController, 'Phone/Email'),
                        const SizedBox(
                          height: 16,
                        ),
                        inputForm(passwordController, 'Password'),
                        const SizedBox(
                          height: 16,
                        ),
                        inputForm(
                            confirmPasswordController, 'Confirm Password'),
                        const SizedBox(
                          height: 16,
                        ),
                        //remember me
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isCheck = !isCheck;

                                  if (isCheck == true) {
                                    SecureStorage().saveAuthStatus('login');
                                  } else {
                                    SecureStorage().saveAuthStatus('');
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    border: Border.all(color: kWhiteColor),
                                    borderRadius: BorderRadius.circular(5)),
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
                              style:
                                  TextStyle(color: kWhiteColor, fontSize: 12),
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
                                nameController.text.isEmpty ||
                                passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              showCustomAlertDialog(context, 'Empty fields !',
                                  CoolAlertType.warning);
                            } else {
                              if (passwordController.text !=
                                  confirmPasswordController.text) {
                                showCustomAlertDialog(context, 'Password does not match !',
                                  CoolAlertType.warning);
                              } else if (!validateEmail(
                                      phoneEmailController.text) &&
                                  !validatePhoneNumber(
                                      phoneEmailController.text)) {
                                showCustomAlertDialog(context, 'Please input correct email or phone number !',
                                  CoolAlertType.warning);
                              } else {
                                if (validateEmail(phoneEmailController.text)) {
                                  type = 'email';
                                } else if (validatePhoneNumber(
                                    phoneEmailController.text)) {
                                  type = 'phone';
                                }

                                context.read<SignUpCubit>().signUpUser(
                                    nameController.text.toString(),
                                    phoneEmailController.text.toString(),
                                    passwordController.text,
                                    confirmPasswordController.text,
                                    type);
                              }
                            }
                          },
                          label: 'Sign Up',
                        ),
                        const SizedBox(
                          height: 8,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText().customText(kTextSmall, kDarkGrayColor,
                                'Already have an account?'),
                            TextButton(
                                onPressed: () {
                                  PageNavigator(ctx: context).nextPage(page: const LoginScreen());
                                },
                                child: Text(
                                  'Login Here',
                                  style: TextStyle(
                                      color: kLightBlueColor, fontSize: 12),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
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
      style: TextStyle(color: kWhiteColor),
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          hintStyle: TextStyle(color: kWhiteColor, fontSize: 16)),
    ),
  );
}
