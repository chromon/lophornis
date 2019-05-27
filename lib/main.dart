import 'package:flutter/material.dart';

import './home/home_screen.dart';
import './constants.dart' show AppColor;

// import 'package:flutter/services.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColor.AppBarColor),
    cardColor: Colors.white,
  ),
  home: HomeScreen()
));
