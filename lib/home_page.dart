import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sai_chits/chits.dart';
import 'package:sai_chits/pick_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              int count = Chits.chitsList.length;
              int index = Random().nextInt(count);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PickPage(
                    index: index,
                  ),
                ),
              );
            },
            child: const Text('Pick a Chit'),
          ),
        ),
      ),
    );
  }
}
