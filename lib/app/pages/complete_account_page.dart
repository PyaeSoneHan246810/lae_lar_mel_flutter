import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/models/user_model.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';
import 'package:lae_lar_mel_app/app/utils/utils.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/custom_separator.dart';
import 'dart:io';

class CompleteAccountPage extends StatefulWidget {
  const CompleteAccountPage({super.key});

  @override
  State<CompleteAccountPage> createState() => _CompleteAccountPageState();
}

class _CompleteAccountPageState extends State<CompleteAccountPage> {
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

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryColor,
                ),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 20, top: 20, right: 20, bottom: 20),
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
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            _displayImagePickerSheet(context);
                          },
                          child: image == null
                              ? const CircleAvatar(
                                  backgroundColor: AppColor.primaryColor,
                                  radius: 70,
                                  child: Icon(
                                    Icons.account_circle_rounded,
                                    size: 80,
                                    color: AppColor.pureWhiteColor,
                                  ),
                                )
                              : CircleAvatar(
                                  backgroundImage: FileImage(image!),
                                  radius: 70,
                                ),
                        ),
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
                            hintText:
                                AppLocalizations.of(context)!.set_username,
                            hintStyle: AppFontStyle.inputHintText,
                            alignLabelWithHint: true,
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
                            prefixIcon: const Icon(
                              Icons.person_rounded,
                              color: AppColor.softLightBlackColor,
                            )),
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        cursorColor: AppColor.primaryColor,
                      ),
                    ),
                    const CustomSeparator(height: 25),
                    FadeInDown(
                      child: Text(
                        AppLocalizations.of(context)!.email,
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                    ),
                    const CustomSeparator(height: 7),
                    FadeInDown(
                      child: TextField(
                        controller: _emailTextController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColor.greyColor,
                          hintText: AppLocalizations.of(context)!.email_hint,
                          hintStyle: AppFontStyle.inputHintText,
                          alignLabelWithHint: true,
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
                          prefixIcon: const Icon(
                            Icons.email_rounded,
                            color: AppColor.softLightBlackColor,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
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
                                // Navigator.of(context).pushNamedAndRemoveUntil(
                                //   'rootPage',
                                //   (route) => false,
                                // );
                                storeUserData();
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

  //store user data to database
  void storeUserData() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: _usernameTextController.text.trim(),
      email: _emailTextController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      userId: "",
    );
    if (image != null) {
      authProvider.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSuccess: () {
          //once data is saved, it also needs to be stored locally
          authProvider.saveUserDataToSharedPreferences().then((value) {
            authProvider.setSignIn().then((value) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RootPage(),
                  ),
                  (route) => false);
            });
          });
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile picture.");
    }
  }
}
