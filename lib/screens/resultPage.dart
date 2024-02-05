import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rushmore/controllers/homeController.dart';
import 'package:rushmore/screens/homeScreen.dart';
import 'package:rushmore/widgets/CardWidgetTwo.dart';
import 'package:share_plus/share_plus.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreen();
}

class _ResultScreen extends State<ResultScreen> {
  GlobalKey globalKey = GlobalKey();
  Uint8List? capturedImageBytes;
  late BannerAd _bannerAd;
  bool isAdloaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initBannerAds();
  }

  _initBannerAds() {
    _bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-5791251748470780/4069777998',
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            setState(() {
              isAdloaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            _bannerAd.dispose();
          },
        ),
        request: const AdRequest());
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
              height: double.maxFinite,
              color: Colors.white,
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        RepaintBoundary(
                          key: globalKey,
                          child: CardWidgetTwo(
                            image1: HomeController.instance.imagesList[0],
                            image2: HomeController.instance.imagesList[1],
                            image3: HomeController.instance.imagesList[2],
                            image4: HomeController.instance.imagesList[3],
                            question: HomeController.instance.questions,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Congratulations!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Your Mount Rushmore is ready. \n Share it with your friends',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                            onTap: () async {
                              RenderRepaintBoundary boundary =
                                  globalKey.currentContext!.findRenderObject()
                                      as RenderRepaintBoundary;
                              ui.Image image =
                                  await boundary.toImage(pixelRatio: 3.0);
                              ByteData? byteData = await image.toByteData(
                                  format: ui.ImageByteFormat.png);
                              if (byteData != null) {
                                capturedImageBytes =
                                    byteData.buffer.asUint8List();
                              }
                              // Get the temporary directory path
                              Directory tempDir = await getTemporaryDirectory();
                              String tempPath = tempDir.path;

                              // Create a file in the temporary directory with a unique name
                              String filePath = '$tempPath/mount_rushmore.png';
                              File file = File(filePath);
                              await file.writeAsBytes(capturedImageBytes!);
                              XFile xFile = XFile(filePath);

                              await Share.shareXFiles([xFile],
                                  text: 'Check out my Mount Rushmore!');
                            },
                            child: Container(
                                width: 284,
                                height: 57,
                                alignment: Alignment.center,
                                decoration: ShapeDecoration(
                                  color: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                child: const Text(
                                  'Share',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ))),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'OR',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {
                            HomeController.instance.celebrities.clear();
                            HomeController.instance.imagesList.clear();
                            Get.off(const HomePage(),
                                transition: Transition.fade);
                          },
                          child: Container(
                              width: 284,
                              height: 57,
                              alignment: Alignment.center,
                              decoration: ShapeDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              child: const Text(
                                'Try Again',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 24,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        ),
                      ]))),
        ]),
        bottomNavigationBar: Container(
          height: _bannerAd.size.height.toDouble(),
          width: _bannerAd.size.width.toDouble(),
          child: AdWidget(ad: _bannerAd),
        ));
    // : const SizedBox());
  }
}
