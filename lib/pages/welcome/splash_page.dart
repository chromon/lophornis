import 'package:flutter/material.dart';
import 'dart:async';

import 'package:lophornis/constants/app_routes.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/ic_splash.png');
  }

  @override
  void initState() {
    super.initState();
    countDown();
  }

  // 倒计时
  void countDown() {
    var _duration = Duration(seconds: 3);
    Future.delayed(_duration, () {
      print(_duration.inSeconds);
      Navigator.pushReplacementNamed(context, Routes.Welcome);
    });
  }
}