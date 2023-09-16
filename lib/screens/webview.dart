//implement web view for screenshot capturing and image storing
//Image Face Cropping
//Getting Images List back
//Placing them in the image widget
//Implement Sharing Options

import 'dart:io';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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
    print('i am clicked');
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      setState(() async {
        capturedImageBytes = byteData.buffer.asUint8List();
        final facebytes = await detectAndCropSingleFace(capturedImageBytes!);
        if (facebytes == null) {
          print('no face found');
          return;
        }
        HomeController.instance.addImages(facebytes);
        print(HomeController.instance.imagesList.length);

        if (counter < celebritiesLength - 1) {
          setState(() {
            counter++;
          });
        } else {
          Get.off(const ResultScreen());
        }
      });
    }
  }

  Future<Uint8List?> detectAndCropSingleFace(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/temp_image.jpg');
    await tempFile.writeAsBytes(imageBytes);
    final faceDetector = FaceDetector(
        options: FaceDetectorOptions(
            enableTracking: true,
            enableLandmarks: true,
            enableClassification: true,
            enableContours: true));
    print('1');
    //convert imageBytes into file
    final inputImage = InputImage.fromFile(tempFile);
    print('2');
    try {
      final faces = await faceDetector.processImage(inputImage);
      print('3');
      if (faces.isEmpty) {
        print('No face detected');
        return null;
      }
      print('4');
      final face = faces.first;
      final rect = face.boundingBox;
      final x = rect.left.toInt();
      print(x);
      final y = rect.top.toInt();
      print(y);
      final width = rect.width.toInt();
      print(width);
      final height = rect.height.toInt();
      print(height);
      final originalImage = img.decodeImage(imageBytes)!;
      img.Image cropped = img.copyCrop(
        originalImage,
        x: x,
        y: y,
        width: width,
        height: height,
      );
      final croppedImageBytes = img.encodeJpg(cropped);
      final croppedFace = Uint8List.fromList(croppedImageBytes);
      await tempFile.delete();
      return croppedFace;
    } catch (e) {
      print('Error during face detection: $e');
      return null;
    } finally {
      await faceDetector.close();
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
                    onTap: captureScreenshot,
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
