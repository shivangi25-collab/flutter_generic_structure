import 'package:flutter/material.dart';
import 'package:flutter_generic_structure/pages/Auth/SplashPage.dart';
import 'package:get/get.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.native,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Generic Structure',
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const SplashPage()),
      ],
    );
  }
}
