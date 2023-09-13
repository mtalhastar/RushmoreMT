import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  List<String> celebrities = [];

  void addCeleberities(dynamic celebritiy) {
    celebrities = celebritiy;
  }

  List<String> getcelebritylist() {
    return celebrities;
  }
}
