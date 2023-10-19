import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:lae_lar_mel_app/app/config/font_styles.dart';
import 'package:lae_lar_mel_app/app/widgets/custom_filled_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/custom_otp_code_text_input_field.dart';
import '../widgets/custom_separator.dart';

class OTPVerificationPage extends StatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  State<OTPVerificationPage> createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  String? _userPhoneNumber;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userPhoneNumber = ModalRoute.of(context)?.settings.arguments as String?;
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
                  AppLocalizations.of(context)!.otp_title,
                  style: AppFontStyle.title1OffBlack,
                ),
              ),
              const CustomSeparator(height: 15),
              FadeInDown(
                child: Text(
                  AppLocalizations.of(context)!.localeName == 'my'
                      ? '$_userPhoneNumber ${AppLocalizations.of(context)!.otp_subtitle}'
                      : '${AppLocalizations.of(context)!.otp_subtitle} $_userPhoneNumber.',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
              const CustomSeparator(height: 80),
              FadeInDown(
                child: const Center(
                  child: Text(
                    '03:00',
                    style: AppFontStyle.captionBigPrimary,
                  ),
                ),
              ),
              const CustomSeparator(height: 32),
              FadeInDown(
                child: const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OTPCodeTextInputField(),
                      OTPCodeTextInputField(),
                      OTPCodeTextInputField(),
                      OTPCodeTextInputField(),
                      OTPCodeTextInputField(),
                    ],
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
                      style: AppFontStyle.captionBigOffBlack,
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
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              'completeAccountPage', (route) => false);
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
                      style: AppFontStyle.captionBigOffBlack,
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
}
