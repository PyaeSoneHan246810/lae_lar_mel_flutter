import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animate_do/animate_do.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../config/colors.dart';
import '../config/font_styles.dart';
import '../widgets/custom_filled_button.dart';
import '../widgets/custom_separator.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  late TextEditingController _phoneNumberTextController;

  @override
  void initState() {
    super.initState();
    _phoneNumberTextController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneNumberTextController.dispose();
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
              FadeInDown(
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: SvgPicture.asset('assets/images/app_logo.svg'),
                  ),
                ),
              ),
              FadeInDown(
                child: const Text(
                  'Enter your phone number to continue.',
                  style: AppFontStyle.captionBigOffBlack,
                ),
              ),
              const CustomSeparator(height: 15),
              FadeInDown(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColor.greyColor,
                    ),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      countries: const [
                        'MM',
                        'TH',
                        'SG',
                      ], // List of allowed countries
                      initialValue: PhoneNumber(isoCode: 'MM'),
                      selectorTextStyle: AppFontStyle.inputText,
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      formatInput: false,
                      textFieldController: _phoneNumberTextController,
                      inputDecoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.greyColor,
                        hintText: 'Mobile Number',
                        hintStyle: AppFontStyle.inputHintText,
                        labelStyle: AppFontStyle.inputText,
                        contentPadding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 20),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: AppColor.primaryColor,
                          ),
                          borderRadius: BorderRadius.circular(
                              10.0), // Change the color here.
                        ),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                        signed: true,
                        decimal: true,
                      ),
                      maxLength: 9,
                      cursorColor: AppColor.primaryColor,
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
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
                              .pushNamed('otpVerificationPage');
                        },
                        text: "Continue",
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
