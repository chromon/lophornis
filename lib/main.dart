import 'package:flutter/material.dart';

import 'package:lophornis/home/home_page.dart';
import 'package:lophornis/constants/app_colors.dart';

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.PrimaryColor),
    cardColor: Color(AppColors.CardBgColor),
    backgroundColor: Color(AppColors.BackgroundColor)
  ),
  home: HomePage(),
));
