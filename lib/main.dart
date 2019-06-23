import 'package:flutter/material.dart';

import 'package:lophornis/pages/chats/chat_page.dart';
import 'package:lophornis/pages/contact/friend_info.dart';
import 'package:lophornis/pages/contact/new_friends_page.dart';
import 'package:lophornis/pages/contact/add_friends_page.dart';
import 'package:lophornis/pages/me/set_nickname.dart';
import 'package:lophornis/pages/welcome/login_page.dart';
import 'package:lophornis/pages/welcome/sign_up.dart';
import 'package:lophornis/pages/welcome/other_login_page.dart';
import 'package:lophornis/pages/welcome/welcome_page.dart';
import 'package:lophornis/pages/me/profile.dart';
import 'package:lophornis/pages/home/home_page.dart';
import 'package:lophornis/pages/welcome/splash_page.dart';
import 'package:lophornis/pages/subscriptions/subscriptioin_accounts_page.dart';

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
  // initialRoute: Routes.Welcome,
  home: SplashPage(),
  routes: {
    Routes.Welcome: (context) => WelcomePage(),
    Routes.Login: (context) => LoginPage(),
    Routes.OtherLogin: (context) => OtherLoginPage(),
    Routes.Signup: (context) => SignUpPage(),
    Routes.Home: (context) => HomePage(),
    Routes.Chat: (context) => ChatPage(),
    Routes.Profile: (context) => ProfilePage(),
    Routes.Settings: (context) => SettingsPage(),
    Routes.NewFriends: (context) => NewFriendsPage(),
    Routes.AddFriends: (context) => AddFriendsPage(),
    Routes.Subscriptions: (context) => SubscriptionAccountsPage(),
    Routes.SetNickname: (context) => SetNicknamePage(),
    Routes.FriendInfo: (context) => FriendInfo(),
  },
));
