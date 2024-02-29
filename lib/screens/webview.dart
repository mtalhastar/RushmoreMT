//implement web view for screenshot capturing and image storing
//Image Face Cropping
//Getting Images List back
//Placing them in the image widget
//Implement Sharing Options

import 'dart:io';
import 'dart:ui';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rushmore/screens/homeScreen.dart';
import 'package:rushmore/screens/resultPage.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:rushmore/controllers/homeController.dart';
// Import for Android features.

class WebScreenShots extends StatefulWidget {
  final String url;
  final String params;
  const WebScreenShots({super.key, required this.url, required this.params});

  @override
  State<WebScreenShots> createState() => _WebScreenShotsState();
}

class _WebScreenShotsState extends State<WebScreenShots> {
  double _progress = 0;
  int counter = 0;
  final celebritiesLength = HomeController.instance.celebrities.length;
  GlobalKey globalKey = GlobalKey();
  Uint8List? capturedImageBytes;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  //  Future<void> captureScreenshot() async {
  //   RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   ui.Image image = await boundary.toImage();
  //   ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  //   if (byteData != null) {
  //     final tempDir = await getApplicationDocumentsDirectory();
  //     final tempFilePath = '${tempDir.path}/temp_image.png';
  //     final file = await File(tempFilePath).writeAsBytes(byteData.buffer.asUint8List());

  //     final facebytes = await detectAndCropSingleFace(file);
  //     if (facebytes == null) {
  //       HomeController.instance.imagesList.clear();
  //       HomeController.instance.celebrities.clear();
  //       Get.off(const HomePage(), transition: Transition.fade);
  //       return;
  //     }
  //     HomeController.instance.addImages(facebytes);

  //     if (counter < celebritiesLength - 1) {
  //       setState(() {
  //         counter++;
  //       });
  //     } else {
  //       Get.off(const ResultScreen());
  //     }
  //   }
  // }

  Future<void> captureScreenshot() async {
    late Uint8List? imageBytes;
    await screenshotController.capture().then((Uint8List? image) {
      imageBytes = image;
      print(image.toString());
    }).catchError((onError) {
      print(onError);
    });

    if (imageBytes != null) {
      final tempDir = await getTemporaryDirectory();
      final tempFilePath = '${tempDir.path}/temp_image.png';
      final file = await File(tempFilePath).writeAsBytes(imageBytes!);

      final facebytes = await detectAndCropSingleFace(file);
      if (facebytes == null) {
        HomeController.instance.imagesList.clear();
        HomeController.instance.celebrities.clear();
        Get.off(const HomePage(), transition: Transition.fade);
        return;
      }
      HomeController.instance.addImages(facebytes);

      if (counter < celebritiesLength - 1) {
        setState(() {
          counter++;
        });
      } else {
        Get.off(const ResultScreen());
      }
    }
  }

  Future<Uint8List?> detectAndCropSingleFace(File imageFile) async {
   
    final faceDetector = FaceDetector(
        options: FaceDetectorOptions(
            enableTracking: true,
            enableLandmarks: true,
            enableClassification: true,
            enableContours: true));

    final inputImage = InputImage.fromFile(imageFile);
    try {
      final faces = await faceDetector.processImage(inputImage);
      if (faces.isEmpty) {
        Get.snackbar('Face Status ', 'No face in the image found');
        return null;
      }

      final face = faces.first;
      final rect = face.boundingBox;
      final x = rect.left.toInt();
      final y = rect.top.toInt();
      final width = rect.width.toInt();
      final height = rect.height.toInt();
      final originalImage = img.decodeImage(imageFile.readAsBytesSync())!;

      img.Image cropped = img.copyCrop(
        originalImage,
        x: x,
        y: y,
        width: width,
        height: height,
      );
      final croppedImageBytes = img.encodeJpg(cropped);
      final croppedFace = Uint8List.fromList(croppedImageBytes);
      await imageFile.delete();
      return croppedFace;
    } catch (e) {
      Get.snackbar('Error While detecting face ', 'Please try again');
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
          child: Screenshot(
            controller: screenshotController,
            child: Stack(
              children: [
                WebViewWidget(
                    controller: WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(const Color.fromARGB(0, 249, 249, 249))
                      ..loadRequest(Uri.parse(
                          '${widget.url}${HomeController.instance.celebrities[counter]}${widget.params}'))),
                Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ClipRect(
                      child: Stack(children: [
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(0, 255, 255, 255),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0))),
                        ),
                        Positioned.fill(
                            child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: Container(
                              height: 200,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(0, 255, 255, 255),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(40.0)))),
                        ))
                      ]),
                    )),
                Positioned(
                  bottom: 150,
                  right: 100,
                  left: 100,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '${counter}/4',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 245, 245, 245),
                          fontWeight: FontWeight.bold,
                          fontSize: 26),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 50,
                    right: 40,
                    left: 40,
                    child: InkWell(
                      onTap: () async {
                        await captureScreenshot();
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
                              color: Color.fromARGB(
                                  255, 36, 36, 36), // Shadow color
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
            ),
          )),
    );
  }
}
