import 'package:flutter/material.dart';

import './home/home_screen.dart';
import './constants.dart' show AppColor;

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColor.PrimaryColor),
    cardColor: Color(AppColor.CardBgColor),
    backgroundColor: Color(AppColor.BackgroundColor)
  ),
  home: HomeScreen(),
));
