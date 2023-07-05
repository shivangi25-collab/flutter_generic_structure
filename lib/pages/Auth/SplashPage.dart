import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 600,
      color: Colors.red,
      child: const Column(
        children: [Text("GIT CHECK"),Text("GIT CHECK"),],
      ),
    );
  }
}
