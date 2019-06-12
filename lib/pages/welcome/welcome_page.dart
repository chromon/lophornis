import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_routes.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  
  @override
  Widget build(BuildContext context) {

    // 设置顶部状态栏透明
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          // 背景图片
          image: AssetImage('assets/images/ic_splash.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // 去掉返回按钮图标
          automaticallyImplyLeading: false,
          // 去掉 appbar 阴影
          elevation: 0,
          actions: <Widget>[
            FlatButton(
              child: Text('语言', style: AppStyles.LanguageStyle,),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28.0,
                  vertical: 32.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        right: 30.0,
                        bottom: 10.0,
                        left: 30.0,
                      ),
                      child: Text('登录', style: AppStyles.WelcomeStyle,),
                      textColor: Colors.white,
                      color: Color(AppColors.MainColor),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.Login);
                      },
                    ),
                    FlatButton(
                      padding: EdgeInsets.only(
                        top: 10.0,
                        right: 30.0,
                        bottom: 10.0,
                        left: 30.0,
                      ),
                      child: Text('注册', style: AppStyles.WelcomeStyle),
                      textColor: Color(AppColors.MainColor),
                      color: Colors.white,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}