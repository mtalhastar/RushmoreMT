import 'dart:typed_data';

import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  List<String> celebrities = [];
  List<Uint8List> imagesList = [];
  String questions = '';
  
  void addCeleberities(dynamic celebritiy) {
    celebrities = celebritiy;
  }

  void addImages(Uint8List element) {
    imagesList.add(element);
  }

  List<String> getcelebritylist() {
    return celebrities;
  }
}
