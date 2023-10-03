import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/account_page.dart';
import 'package:lae_lar_mel_app/app/pages/featured_page.dart';
import 'package:lae_lar_mel_app/app/pages/my_learning_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text('Hello!!'),
      ),
    );
  }
}
