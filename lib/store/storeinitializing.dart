
import 'package:get/get.dart';
import 'package:rushmore/controllers/homeController.dart';

class StoreBinding implements Bindings {
// default dependency
 @override
 void dependencies() {
   Get.put(HomeController());
 }
}