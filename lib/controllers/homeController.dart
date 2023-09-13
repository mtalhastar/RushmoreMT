import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  List<String> celebrities = [];

  void addCeleberities(dynamic celebritiy) {
    celebrities = celebritiy;
  }

  List<String> getcelebritylist(){
    return celebrities;
  }
}
