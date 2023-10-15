import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:rushmore/screens/splashScreen.dart';
import 'package:get/get.dart';
import 'package:rushmore/store/storeinitializing.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const GetStartedScreen(),
      initialBinding: StoreBinding(),
    );
  }
}
