import 'package:flutter/material.dart';

import 'package:lophornis/pages/chats/chat_page.dart';
import 'package:lophornis/pages/contact/new_friends_page.dart';
import 'package:lophornis/pages/welcome/welcome_page.dart';
import 'package:lophornis/pages/me/profile.dart';
import 'package:lophornis/pages/home/home_page.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_routes.dart';
import 'package:lophornis/pages/me/settings.dart';

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData.light().copyWith(
    primaryColor: Color(AppColors.PrimaryColor),
    cardColor: Color(AppColors.CardBgColor),
    backgroundColor: Color(AppColors.BackgroundColor)
  ),
  initialRoute: Routes.Welcome,
  routes: {
    Routes.Welcome: (context) => WelcomePage(),
    Routes.Home: (context) => HomePage(),
    Routes.Chat: (context) => ChatPage(),
    Routes.Profile: (context) => ProfilePage(),
    Routes.Settings: (context) => SettingsPage(),
    Routes.NewFriends: (context) => NewFriendsPage(),
  },
));
