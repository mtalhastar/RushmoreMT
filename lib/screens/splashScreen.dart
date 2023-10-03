import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rushmore/controllers/homeController.dart';
import 'package:rushmore/screens/homeScreen.dart';
import 'package:rushmore/screens/instructions.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.maxFinite,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'assets/images/rushmore.png',
                  height: 200,
                  width: 200,
                ),
                const Text(
                  'Mount Rushmore',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Check who’s on your mount Rushmore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    Get.off( Instructions(),
                        transition: Transition.fade,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 57,
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    decoration: ShapeDecoration(
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
