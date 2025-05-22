import 'package:flutter/material.dart';
import 'package:pwa_install/pwa_install.dart';
import 'package:sai_chits/home_page.dart';

void main() {
  PWAInstall().setup(installCallback: () {
    debugPrint('APP INSTALLED!');
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sai Chits',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}
