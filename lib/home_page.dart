import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sai_chits/chits.dart';
import 'package:sai_chits/pick_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _swamiFrame(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: constraints.maxHeight * 0.05,
              horizontal: 10,
            ),
            child: Image.asset(
              'assets/swami.jpg',
            ),
          ),
        );
      },
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

  precacheImages(BuildContext context) {
    // pre cache images of home page
    precacheImage(const AssetImage("assets/swami.jpg"), context);
    precacheImage(const AssetImage("assets/house.png"), context);
    // pre cache images of pick page
    precacheImage(const AssetImage("assets/left_top.png"), context);
    precacheImage(const AssetImage("assets/right_top.png"), context);
    precacheImage(const AssetImage("assets/left_bottom.png"), context);
    precacheImage(const AssetImage("assets/right_bottom.png"), context);
    precacheImage(const AssetImage("assets/shilloute.png"), context);
  }

  @override
  void didChangeDependencies() {
    precacheImages(context);
    super.didChangeDependencies();
  }

  _appBar() {
    return kIsWeb
        ? AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  tooltip: 'More Info',
                  onPressed: () async {
                    // launch the url into github repo
                    final url =
                        Uri.parse('https://github.com/immadisairaj/sai_chits');
                    if (!await launchUrl(url)) {
                      // Do nothing when cannot launch
                    }
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: Colors.orange[300],
      body: SafeArea(
        child: Container(
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
      ),
    );
  }
}
