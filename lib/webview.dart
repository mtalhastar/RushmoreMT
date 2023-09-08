//implement web view for screenshot capturing and image storing
//Image Face Cropping
//Getting Images List back
//Placing them in the image widget
//Implement Sharing Options

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// Import for Android features.

class WebScreenShots extends StatefulWidget {
  const WebScreenShots({super.key});

  @override
  State<WebScreenShots> createState() => _WebScreenShotsState();
}

class _WebScreenShotsState extends State<WebScreenShots> {
  double _progress = 0;
  late final InAppWebViewController inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        'https://www.google.com/search?q=ronaldo+face')),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                
                onProgressChanged: (controller, progress) => setState(() {
                  _progress = progress / 100;
                }),
              ),
              if (_progress < 1)
                LinearProgressIndicator(
                  value: _progress
                ),
                Positioned(
                  bottom: 50,
                  left: 50,
                  right: 50,
                  child: InkWell(
                    
                    child: Container(height: 60,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                       boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 36, 36, 36), // Shadow color
                            offset: Offset(0, 2), // Offset in x and y directions
                            blurRadius: 4, // Blur radius
                            spreadRadius: 0, // Spread radius
                          ),
                        ],
                      ),
                      
                      child:  const Text('Process Image',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20), ),
                    ),
                  ))
            ],
          )),
    );
  }
}
