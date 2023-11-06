import 'package:flutter/material.dart';

import '../widgets/custom_appbar_with_back_arrow_and_title.dart';

class InstructorProfilePage extends StatefulWidget {
  const InstructorProfilePage({super.key});

  @override
  State<InstructorProfilePage> createState() => _InstructorProfilePageState();
}

class _InstructorProfilePageState extends State<InstructorProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithBackArrowAndTitle(
        titleText: 'Instructor profile',
        onBackButtonPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
