import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/config/colors.dart';

import 'custom_separator.dart';

class PaymentOptionSelector extends StatefulWidget {
  final bool isMorePaymentOptionsVisible;
  final void Function(String?) onOptionSelected; // Callback function
  const PaymentOptionSelector({
    super.key,
    required this.isMorePaymentOptionsVisible,
    required this.onOptionSelected,
  });

  @override
  State<PaymentOptionSelector> createState() => _PaymentOptionSelectorState();
}

class _PaymentOptionSelectorState extends State<PaymentOptionSelector> {
  String? selectedOption;
  Map<String, String> imageToIdMap = {
    'kbz_pay_logo.png': 'kbz_pay',
    'aya_pay_logo.png': 'aya_pay',
    'one_pay_logo.jpg': 'one_pay',
    'wave_pay_logo.png': 'wave_pay',
    'visa_logo.png': 'visa',
    'mastercard_logo.jpg': 'mastercard',
    'mPiteSan_logo.png': 'mPiteSan',
    'mpu_logo.jpg': 'mpu',
    'a_bank_logo.png': 'a_bank',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPaymentOptionsRow([
          'kbz_pay_logo.png',
          'aya_pay_logo.png',
          'one_pay_logo.jpg',
        ]),
        const CustomSeparator(height: 12),
        _buildPaymentOptionsRow([
          'wave_pay_logo.png',
          'visa_logo.png',
          'mastercard_logo.jpg',
        ]),
        const CustomSeparator(height: 12),
        Visibility(
          visible: widget.isMorePaymentOptionsVisible,
          child: _buildPaymentOptionsRow([
            'mPiteSan_logo.png',
            'mpu_logo.jpg',
            'a_bank_logo.png',
          ]),
        ),
      ],
    );
  }

  Widget _buildPaymentOptionsRow(List<String> imagePaths) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: imagePaths.map((path) => _buildPaymentOption(path)).toList(),
    );
  }

  Widget _buildPaymentOption(String imagePath) {
    final isSelected = selectedOption == imageToIdMap[imagePath];

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = isSelected ? null : imageToIdMap[imagePath];
        });
        widget.onOptionSelected(selectedOption);
      },
      child: Container(
        width: 100,
        height: 75,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: AppColor.primaryColor,
                  width: 3.0,
                )
              : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(
            'assets/images/$imagePath',
            width: 100,
            height: 75,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
