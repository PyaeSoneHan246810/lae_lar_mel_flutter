import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/pages/complete_account_page.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';
import 'package:lae_lar_mel_app/app/utils/utils.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../providers/auth_provider.dart';
import '../widgets/custom_otp_code_text_input_field.dart';
import '../widgets/custom_separator.dart';

class OTPVerificationPage extends StatefulWidget {
  final String verificationId;
  const OTPVerificationPage({super.key, required this.verificationId});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  String? otpCode;
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
                        AppLocalizations.of(context)!.otp_title,
                        style: AppFontStyle.title1OffBlack(context),
                      ),
                    ),
                    const CustomSeparator(height: 15),
                    FadeInDown(
                      child: Text(
                        AppLocalizations.of(context)!.localeName == 'my'
                            ? AppLocalizations.of(context)!.otp_subtitle
                            : AppLocalizations.of(context)!.otp_subtitle,
                        style: AppFontStyle.captionBigOffBlack(context),
                      ),
                    ),
                    const CustomSeparator(height: 80),
                    FadeInDown(
                      child: Center(
                        child: Pinput(
                          length: 6,
                          showCursor: true,
                          defaultPinTheme: PinTheme(
                            width: 60,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.greyColor,
                              border: const Border.fromBorderSide(
                                BorderSide(color: AppColor.primaryColor),
                              ),
                            ),
                            textStyle: AppFontStyle.inputText,
                          ),
                          onCompleted: (value) {
                            setState(() {
                              otpCode = value;
                            });
                          },
                        ),
                      ),
                    ),
                    const CustomSeparator(height: 32),
                    FadeInDown(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.no_receive_code,
                            style: AppFontStyle.captionBigOffBlack(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                AppLocalizations.of(context)!.resend,
                                style: AppFontStyle.navTextPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSeparator(height: 80),
                    FadeInUp(
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomFilledButton(
                              onPressed: () {
                                if (otpCode != null) {
                                  verifyOTP(context, otpCode!);
                                } else {
                                  showSnackBar(
                                      context,
                                      AppLocalizations.of(context)!
                                          .enter_6_digit);
                                }
                              },
                              text: AppLocalizations.of(context)!.submit,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const CustomSeparator(height: 10),
                    FadeInUp(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.wrong_phone_number,
                            style: AppFontStyle.captionBigOffBlack(context),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.go_back,
                                style: AppFontStyle.navTextPrimary,
                              ),
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

  //verify OTP
  void verifyOTP(BuildContext context, String userOTP) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.verifyOTP(
      context: context,
      verificationId: widget.verificationId,
      userOTP: userOTP,
      onSuccess: () {
        authProvider.checkExistingUser().then((value) async {
          if (value == true) {
            //user exists
            authProvider.getDataFromFireStore().then((value) {
              authProvider.saveUserDataToSharedPreferences().then((value) {
                authProvider.setSignIn().then((value) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('rootPage', (route) => false);
                });
              });
            });
          } else {
            //new user
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const CompleteAccountPage(),
                ),
                (route) => false);
          }
        });
      },
    );
  }
}
