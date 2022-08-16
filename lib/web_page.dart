import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WebPage extends StatelessWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: Image.asset(
                  'assets/shilloute.png',
                ),
              ),
              Text(
                'Sai Chits',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    // launch the url into github repo
                    final url =
                        Uri.parse('https://github.com/immadisairaj/sai_chits');
                    if (!await launchUrl(url)) {
                      // Do nothing when cannot launch
                    }
                  },
                  child: const Text('More Details')),
            ],
          ),
        ),
      ),
    );
  }
}
