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
      child: Column(
        children: [
          Text("shivangi 123"),
          Text("krishna 6666"),
          Text("krishna 6666fgjgfgsjfgjhgsdjdfh"),
          Text("krishna and shivangi")
        ],
      ),

    );
  }
}
