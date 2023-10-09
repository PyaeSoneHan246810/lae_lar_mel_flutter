import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final String username = 'Pyae Sone Han';
  late TextEditingController _usernameTextController;
  late TextEditingController _emailTextController;

  @override
  void initState() {
    super.initState();
    _usernameTextController = TextEditingController();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameTextController.dispose();
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrow(
        titleText: 'Edit Profile',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColor.pureWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                    child: Center(
                      child: CircleAvatar(
                        radius: 72,
                        backgroundColor: AppColor.primaryColor,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/profile_placeholder.jpg',
                            height: 140,
                            width: 140,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 110,
                    top: 12,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 28,
                        color: AppColor.primaryColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            FadeInDown(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  'Username',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
            ),
            const CustomSeparator(height: 7),
            FadeInDown(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextField(
                  controller: _usernameTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: username,
                    hintStyle: AppFontStyle.inputText,
                    labelStyle: AppFontStyle.inputText,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.primaryColor,
                      ), // Change the color here.
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                  ),
                  keyboardType: TextInputType.name,
                  cursorColor: AppColor.primaryColor,
                ),
              ),
            ),
            FadeInDown(
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Text(
                  'Email',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
            ),
            const CustomSeparator(height: 7),
            FadeInDown(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: "Add your email",
                    hintStyle: AppFontStyle.inputHintText,
                    labelStyle: AppFontStyle.inputText,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.primaryColor,
                      ), // Change the color here.
                    ),
                    contentPadding: const EdgeInsets.only(
                        left: 15, right: 15, top: 20, bottom: 20),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: AppColor.primaryColor,
                ),
              ),
            ),
            FadeInUp(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: CustomFilledButton(
                  onPressed: () {},
                  text: 'Save',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
