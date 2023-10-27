import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/utils/utils.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_appbar_with_back_arrow_and_title.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_separator.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../providers/auth_provider.dart';
import '../providers/theme_mode_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  File? image;
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

  Future<void> _displayImagePickerSheet(BuildContext context) async {
    if (Theme.of(context).platform == TargetPlatform.android) {
      // Modal Button Sheet for android devices
      return showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          final themeModeProvider =
              Provider.of<ThemeModeProvider>(context, listen: false);
          return Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
            child: Wrap(
              alignment: WrapAlignment.end,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: [
                const Center(
                  child: Text(
                    'Select profile image from',
                    style: AppFontStyle.alertTitlePrimary,
                  ),
                ),
                const CustomSeparator(
                  height: 12,
                ),
                ListTile(
                  leading: Icon(
                    Icons.image,
                    color: themeModeProvider.themeMode == ThemeMode.light
                        ? AppColor.offBlackColor
                        : AppColor.greyColor,
                  ),
                  iconColor: AppColor.lightBlackColor,
                  titleTextStyle: AppFontStyle.alertTextOffBlack(context),
                  horizontalTitleGap: 8,
                  title: const Text(
                    'Photo Gallery',
                  ),
                  onTap: () async {
                    image = await pickImageFromGallery(context);
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.camera,
                    color: themeModeProvider.themeMode == ThemeMode.light
                        ? AppColor.offBlackColor
                        : AppColor.greyColor,
                  ),
                  iconColor: AppColor.lightBlackColor,
                  titleTextStyle: AppFontStyle.alertTextOffBlack(context),
                  horizontalTitleGap: 8,
                  title: const Text(
                    'Camera',
                  ),
                  onTap: () async {
                    image = await pickImageFromCamera(context);
                    setState(() {});
                  },
                ),
              ],
            ),
          );
        },
      );
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      // Cupertino Action Sheet for iOS devices
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text(
            'Select profile image from',
            style: AppFontStyle.alertTitlePrimary,
          ),
          actions: [
            CupertinoActionSheetAction(
              child: Text(
                'Photo Gallery',
                style: AppFontStyle.alertTextOffBlack(context),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoActionSheetAction(
              child: Text(
                'Camera',
                style: AppFontStyle.alertTextOffBlack(context),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text(
              'Cancel',
              style: AppFontStyle.alertTextRed,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      );
    }
  }

  Future updateImage() async {
    if (image == null) {
      return;
    }
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      String imageUrl = await authProvider.storeFileToStorage(
          "profilePic/${authProvider.userId}", image!);
      // Update the profile picture URL in FireStore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(authProvider.userId)
          .update({'profilePic': imageUrl});
      // Update the userModel's profilePic as well
      authProvider.userModel.profilePic = imageUrl;
    } catch (e) {
      print('Error updating image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: AppLocalizations.of(context)!.edit_profile,
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDown(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: Center(
                  child: Stack(
                    children: [
                      image == null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(
                                  authProvider.userModel.profilePic),
                              radius: 75,
                            )
                          : CircleAvatar(
                              backgroundImage: FileImage(image!),
                              radius: 75,
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            _displayImagePickerSheet(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: AppColor.pureWhiteColor,
                                width: 2,
                              ),
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: AppColor.pureWhiteColor,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  AppLocalizations.of(context)!.username,
                  style: AppFontStyle.captionBigOffBlack(context),
                ),
              ),
            ),
            const CustomSeparator(height: 7),
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextField(
                  controller: _usernameTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: authProvider.userModel.name,
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
                  keyboardType: TextInputType.name,
                  cursorColor: AppColor.primaryColor,
                ),
              ),
            ),
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: Text(
                  AppLocalizations.of(context)!.email,
                  style: AppFontStyle.captionBigOffBlack(context),
                ),
              ),
            ),
            const CustomSeparator(height: 7),
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: TextField(
                  controller: _emailTextController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.greyColor,
                    hintText: authProvider.userModel.email,
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
            FadeInLeft(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                child: CustomFilledButton(
                  onPressed: () {
                    if (_usernameTextController.text.isEmpty) {
                      _usernameTextController.text =
                          authProvider.userModel.name; // Set a default username
                    }
                    if (_emailTextController.text.isEmpty) {
                      _emailTextController.text =
                          authProvider.userModel.email; // Set a default email
                    }
                    final docUser = FirebaseFirestore.instance
                        .collection('users')
                        .doc(authProvider.userId);
                    docUser.update({
                      'name': _usernameTextController.text.trim(),
                      'email': _emailTextController.text.trim(),
                    });
                    updateImage();
                    showSnackBar(
                        context, AppLocalizations.of(context)!.updated_message);
                    Navigator.pushNamedAndRemoveUntil(
                        context, 'phoneNumberPage', (route) => false);
                  },
                  text: AppLocalizations.of(context)!.save,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
