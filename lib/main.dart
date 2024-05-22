import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart'
    show GoogleSignInPlatform;
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:subway_seat/binding/init_binding.dart';
import 'package:subway_seat/firebase_options.dart';
import 'package:subway_seat/helpers/analytics.dart';
import 'package:subway_seat/landing/home/my_home_page.dart';
import 'package:subway_seat/theme/base_theme.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final plugin = GoogleSignInPlatform.instance as GoogleSignInPlugin;
  await plugin.init();
  // //.env init
  // await dotenv.load(fileName: ".env");
  //analytics
  Analytics().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fadeIn,
      initialBinding: InitBinding(),
      title: 'SubwaySeat',
      theme: baseTheme(context),
      home: const MyHomePage(),
    );
  }
}
