import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidgetTwo extends StatelessWidget {
  final Uint8List image1;
  final Uint8List image2;
  final Uint8List image3;
  final Uint8List image4;

  const CardWidgetTwo(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.image4});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset(
            'assets/images/mtrushmore.png',
            width: double.maxFinite,
          ),
        ),
        Positioned(
            left: context.isPortrait
                ? MediaQuery.of(context).size.width / 13.4
                : MediaQuery.of(context).size.width / 13,
            top: context.isPortrait
                ? MediaQuery.of(context).size.height / 50
                : MediaQuery.of(context).size.height / 8.5,
            child: FittedBox(
              child: Container(
                  height: context.isPortrait
                      ? MediaQuery.of(context).size.height / 10
                      : MediaQuery.of(context).size.height / 2.6,
                  width: MediaQuery.of(context).size.width / 5.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    image: DecorationImage(
                        image: MemoryImage(image1), fit: BoxFit.cover),
                  )),
            )),
        Positioned(
          left: context.isPortrait
              ? MediaQuery.of(context).size.width / 3.3
              : MediaQuery.of(context).size.width / 3.32,
          top: context.isPortrait
              ? MediaQuery.of(context).size.height / 14
              : MediaQuery.of(context).size.width / 6,
          child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(0.2)
                ..rotateZ(-0.2),
              child: Container(
                height: context.isPortrait
                    ? MediaQuery.of(context).size.height / 12
                    : MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                      image: MemoryImage(image2), fit: BoxFit.cover),
                ),
              )),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2.06,
          top: context.isPortrait
              ? MediaQuery.of(context).size.height / 8.4
              : MediaQuery.of(context).size.height / 1.9,
          child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(0.7),
              child: Container(
                height: context.isPortrait
                    ? MediaQuery.of(context).size.height / 10.9
                    : MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 5.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  image: DecorationImage(
                      image: MemoryImage(image3), fit: BoxFit.cover),
                ),
              )),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width / 16,
          top: context.isPortrait
              ? MediaQuery.of(context).size.height / 8.5
              : MediaQuery.of(context).size.height / 2,
          child: Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(0.7),
                child: Container(
                  height: context.isPortrait
                      ? MediaQuery.of(context).size.height / 11
                      : MediaQuery.of(context).size.height / 2.4,
                  width: MediaQuery.of(context).size.width / 5,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    image: DecorationImage(
                        image: MemoryImage(image4), fit: BoxFit.cover),
                  ),
                ),
              ),
        )
      ]),
    );
  }
}
