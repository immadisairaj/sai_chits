import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sai_chits/chits.dart';

class PickPage extends StatelessWidget {
  const PickPage({Key? key, required this.index}) : super(key: key);

  final int index;

  Widget _swamiShilloute(BuildContext context) {
    return Image.asset(
      'assets/shilloute.png',
    );
  }

  Widget _text(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          Chits.chitsList[index],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  List<Widget> _children(BuildContext context) {
    return [
      Flexible(
        flex: 1,
        child: _swamiShilloute(context),
      ),
      Flexible(
        flex: 1,
        child: _text(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 218, 253, 255),
        child: Material(
          color: Colors.transparent,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.maybePop(context),
                  icon: Icon(
                    Platform.isAndroid
                        ? Icons.arrow_back_outlined
                        : CupertinoIcons.back,
                    size: 32,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/left_top.png',
                            alignment: Alignment.topLeft,
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Image.asset(
                            'assets/right_top.png',
                            alignment: Alignment.topRight,
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Image.asset(
                            'assets/left_bottom.png',
                            alignment: Alignment.bottomLeft,
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/right_bottom.png',
                            alignment: Alignment.bottomRight,
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.25,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.1,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.1,
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                if (constraints.maxWidth >
                                    constraints.maxHeight) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: _children(context),
                                  );
                                } else {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: _children(context),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
