//implement web view for screenshot capturing and image storing
//Image Face Cropping
//Getting Images List back
//Placing them in the image widget
//Implement Sharing Options

import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:rushmore/screens/resultPage.dart';
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
  int counter = 0;
  final celebritiesLength = HomeController.instance.celebrities.length;
  GlobalKey globalKey = GlobalKey();
  Uint8List? capturedImageBytes;

  Future<void> captureScreenshot() async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      setState(() {
        capturedImageBytes = byteData.buffer.asUint8List();
        HomeController.instance.addImages(capturedImageBytes!);
        print(HomeController.instance.imagesList.length);
        print(capturedImageBytes!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Stack(
            children: [
              RepaintBoundary(
                key: globalKey,
                child: WebViewWidget(
                    controller: WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(Color.fromARGB(0, 249, 249, 249))
                      ..loadRequest(Uri.parse(
                          'https://www.google.com/search?q=${HomeController.instance.celebrities[counter]}+face'))),
              ),
              Positioned(
                  bottom: 50,
                  right: 40,
                  left: 40,
                  child: InkWell(
                    onTap: () {
                      if (counter < celebritiesLength - 1) {
                        captureScreenshot().then((value) => setState(() {
                              counter++;
                            }));
                      } else {
                        captureScreenshot()
                            .then((value) => Get.off(const ResultScreen()));
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
