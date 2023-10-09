import 'package:flutter/material.dart';

class CustomSeparator extends SizedBox {
  const CustomSeparator({
    double height = 42.0,
    double width = double.infinity,
    Key? key,
  }) : super(
          key: key,
          width: width,
          height: height,
        );
}
