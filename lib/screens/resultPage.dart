import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rushmore/controllers/homeController.dart';
import 'package:rushmore/screens/homeScreen.dart';
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
                      const SizedBox(
                        height: 100,
                      ),
                      CardWidgetTwo(
                        image1: HomeController.instance.imagesList[0],
                        image2: HomeController.instance.imagesList[1],
                        image3: HomeController.instance.imagesList[2],
                        image4: HomeController.instance.imagesList[3],
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
                      Container(
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
                          )),
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
                          Get.off(const HomePage(),transition: Transition.fade);
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
                    ]))));
  }
}
