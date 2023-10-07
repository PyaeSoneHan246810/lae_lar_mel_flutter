import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_separator.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late TextEditingController _passwordTextController;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.pureWhiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 62, right: 20, bottom: 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSeparator(height: 40),
              FadeInDown(
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 170,
                    child: SvgPicture.asset(
                        'assets/images/reset_password_illustration.svg'),
                  ),
                ),
              ),
              const CustomSeparator(height: 42),
              FadeInDown(
                child: const Text(
                  'Reset your password',
                  style: AppFontStyle.title1OffBlack,
                ),
              ),
              const CustomSeparator(height: 25),
              FadeInDown(
                child: const Text(
                  'Password',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
              const CustomSeparator(height: 7),
              FadeInDown(
                child: TextField(
                  controller: _passwordTextController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: 'Enter your new password',
                    hintStyle: AppFontStyle.inputHintText,
                    labelStyle: AppFontStyle.inputText,
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.primaryColor,
                      ), // Change the color here.
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColor.softLightBlackColor,
                      ),
                    ),
                  ),
                  cursorColor: AppColor.primaryColor,
                ),
              ),
              const CustomSeparator(height: 25),
              FadeInUp(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomFilledButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('loginPage');
                        },
                        text: "Reset",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
