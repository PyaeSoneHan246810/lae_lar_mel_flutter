import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 62, right: 20, bottom: 62),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSeparator(height: 40),
              FadeInDown(
                child: Text(
                  AppLocalizations.of(context)!.complete_account_title,
                  style: AppFontStyle.title1OffBlack(context),
                ),
              ),
              const CustomSeparator(height: 25),
              FadeInDown(
                child: Text(
                  AppLocalizations.of(context)!.username,
                  style: AppFontStyle.captionBigOffBlack(context),
                ),
              ),
              const CustomSeparator(height: 7),
              FadeInDown(
                child: TextField(
                  controller: _usernameTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: AppLocalizations.of(context)!.set_username,
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
                child: Text(
                  AppLocalizations.of(context)!.password,
                  style: AppFontStyle.captionBigOffBlack(context),
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
                    hintText: AppLocalizations.of(context)!.set_password,
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
                child: Text(
                  AppLocalizations.of(context)!.confirm_password,
                  style: AppFontStyle.captionBigOffBlack(context),
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
                    hintText: AppLocalizations.of(context)!.type_password_again,
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
                            'rootPage',
                            (route) => false,
                          );
                        },
                        text: AppLocalizations.of(context)!.complete,
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
