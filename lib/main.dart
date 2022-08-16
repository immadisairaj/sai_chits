import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sai_chits/home_page.dart';
import 'package:sai_chits/web_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sai Chits',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.cyan,
      ),
      home: kIsWeb ? const WebPage() : const HomePage(),
    );
  }
}
