import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rushmore/controllers/homeController.dart';
import 'package:rushmore/widgets/CardWidgetTwo.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.maxFinite,
            color: Colors.white,
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CardWidgetTwo(
                        image1: HomeController.instance.imagesList[0],
                        image2: HomeController.instance.imagesList[1],
                        image3: HomeController.instance.imagesList[2],
                        image4: HomeController.instance.imagesList[3],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      const Text(
                        'Type Celebrity Names',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ]))));
  }
}
