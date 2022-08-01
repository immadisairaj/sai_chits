import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sai_chits/chits.dart';
import 'package:sai_chits/pick_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _swamiFrame(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/swami.jpg',
      ),
    );
  }

  Widget _pickNavigate(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            'assets/house.png',
            fit: BoxFit.cover,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Padding(
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.08),
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
                  child: Text(
                    'Pick a Chit',
                    style: TextStyle(
                      fontSize: constraints.maxHeight * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  List<Widget> _children(BuildContext context) {
    return [
      Flexible(
        flex: 1,
        child: _swamiFrame(context),
      ),
      Flexible(
        flex: 1,
        child: _pickNavigate(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange[200],
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > constraints.maxHeight) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _children(context),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _children(context),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
