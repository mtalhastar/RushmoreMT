import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rushmore/widgets/cardwidget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: double.maxFinite,
            color: Colors.white,
            child: const SingleChildScrollView(
                physics:  BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       CardWidget(
                        image1: 'assets/images/ronaldoimage.png',
                        image2: 'assets/images/ronaldoimage.png',
                        image3: 'assets/images/ronaldoimage.png',
                        image4: 'assets/images/ronaldoimage.png',
                      ),
                       SizedBox(
                        height: 40,
                      ),
                       Text(
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
