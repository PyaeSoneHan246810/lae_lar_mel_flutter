import 'package:flutter/material.dart';
import 'package:lae_lar_mel_app/app/pages/root_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const RootPage(),
    );
  }
}
