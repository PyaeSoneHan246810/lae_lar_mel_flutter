import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';

import '../widgets/custom_separator.dart';

class CompleteAccountPage extends StatefulWidget {
  const CompleteAccountPage({super.key});

  @override
  State<CompleteAccountPage> createState() => _CompleteAccountPageState();
}

class _CompleteAccountPageState extends State<CompleteAccountPage> {
  late TextEditingController _usernameTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _confirmedPasswordTextController;
  bool _isPasswordVisible = false;
  bool _isConfirmedPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _confirmedPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _passwordTextController.dispose();
    _confirmedPasswordTextController.dispose();
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
                child: const Text(
                  'Complete your account',
                  style: AppFontStyle.title1OffBlack,
                ),
              ),
              const CustomSeparator(height: 25),
              FadeInDown(
                child: const Text(
                  'Username',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
              const CustomSeparator(height: 7),
              FadeInDown(
                child: TextField(
                  controller: _usernameTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: 'Set your username',
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
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: AppColor.primaryColor,
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
                    hintText: 'Set your password',
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
              FadeInDown(
                child: const Text(
                  'Confirm Password',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
              const CustomSeparator(height: 7),
              FadeInDown(
                child: TextField(
                  controller: _confirmedPasswordTextController,
                  obscureText: !_isConfirmedPasswordVisible,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: 'Type your password again',
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
                          _isConfirmedPasswordVisible =
                              !_isConfirmedPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isConfirmedPasswordVisible
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
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'rootPage', (route) => false);
                        },
                        text: "Complete",
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
