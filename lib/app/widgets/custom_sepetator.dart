import 'package:flutter/material.dart';

class CustomSeparator extends SizedBox {
  const CustomSeparator({
    double height = 42.0,
    Key? key,
  }) : super(
          key: key,
          width: double.infinity,
          height: height,
        );
}
