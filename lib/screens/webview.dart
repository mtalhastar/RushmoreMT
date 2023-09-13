//implement web view for screenshot capturing and image storing
//Image Face Cropping
//Getting Images List back
//Placing them in the image widget
//Implement Sharing Options

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:rushmore/controllers/homeController.dart';
// Import for Android features.

class WebScreenShots extends StatefulWidget {
  const WebScreenShots({super.key});

  @override
  State<WebScreenShots> createState() => _WebScreenShotsState();
}

class _WebScreenShotsState extends State<WebScreenShots> {
  double _progress = 0;
  late final WebViewController webViewController;
  int counter = 0;
  final celebritiesLength = HomeController.instance.celebrities.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              WebViewWidget(
                  controller: webViewController
                    ..setJavaScriptMode(JavaScriptMode.unrestricted)
                    ..setBackgroundColor(Color.fromARGB(0, 249, 249, 249))
                    ..setNavigationDelegate(
                      NavigationDelegate(
                        onProgress: (int progress) {
                          _progress = progress / 100;
                        },
                      ),
                    )
                    ..loadRequest(Uri.parse(
                        'https://www.google.com/search?q=${HomeController.instance.celebrities[counter]}+face'))),
              if (_progress < 1) LinearProgressIndicator(value: _progress),
              Positioned(
                  bottom: 50,
                  right: 40,
                  left: 40,
                  child: InkWell(
                    onTap: () {
                          if (counter < celebritiesLength) {
                           setState(() {
                          counter++;
                        });
                        }
                    },
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromARGB(255, 36, 36, 36), // Shadow color
                            offset:
                                Offset(0, 2), // Offset in x and y directions
                            blurRadius: 4, // Blur radius
                            spreadRadius: 0, // Spread radius
                          ),
                        ],
                      ),
                      child: const Text(
                        'Process Image',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
