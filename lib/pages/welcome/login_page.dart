import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lophornis/constants/app_routes.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    // 设置顶部状态栏透明
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    // 手机号的控制器
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(AppColors.PrimaryColor),
      appBar: AppBar(
        title: Text(''),
        // 返回图标
        leading: IconButton(
          icon: Icon(
            IconData(
              0xe660,
              fontFamily: AppConstants.IconFontFamilyExtra,
            ),
            size: AppConstants.ActionIconSize - 4.0,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: const Color(AppColors.PrimaryColor),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Theme(
                // 输入框先划线颜色，激活时颜色和未激活时颜色
                data: ThemeData(primaryColor: Color(AppColors.MainColor), hintColor: Colors.black12),
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          top: 40.0,
                          bottom: 40.0,
                        ),
                        child: Text('手机号登录', style: AppStyles.LoginTitleStyle,),
                      ),
                      Row(
                        children: <Widget>[
                          Text('国家/地区', style: TextStyle(fontSize: 20.0),),
                          FlatButton(
                            child: Text('中国（+86）', style: TextStyle(fontSize: 20.0, color: Color(AppColors.MainColor)),),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('手机号 ', style: TextStyle(fontSize: 20.0, color: Color(AppColors.ActionIconColor),)),
                          SizedBox(width: 10.0,),
                          Expanded(
                            child: 
                              TextField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                // maxLength: 11,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(5.0),
                                  prefixText: '+86 ',
                                  prefixStyle: TextStyle(fontSize: 20.0, color: Color(AppColors.ActionIconColor)),
                                  // fillColor: Colors.lightBlue,
                                  // filled: true,
                                  // border: 
                                ),
                                cursorColor: Color(AppColors.MainColor),
                              ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            child: Text('用微信号/QQ号/邮箱登录', style: TextStyle(fontSize: 20.0, color: Color(AppColors.LoginLinkTextColor),)),
                            onTap: () {
                              Navigator.pushNamed(context, Routes.OtherLogin);
                            },
                          ),],
                      ),
                      SizedBox(height: 64.0),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: MaterialButton(
                              color: Color(AppColors.MainColor),
                              height: 48.0,
                              child: Text('下一步', style: TextStyle(fontSize: 22.0, color: Colors.white),),
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(context, Routes.Home, (Route<dynamic> route) => false);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

            ) 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Text('找回密码', style: TextStyle(fontSize: 16.0, color: Color(AppColors.LoginLinkTextColor),)),
                onTap: () {},
              ),
              Text(' | ', style: TextStyle(fontSize: 20.0, color: Color(AppColors.LoginLinkTextColor),)),
              InkWell(
                child: Text('紧急冻结', style: TextStyle(fontSize: 16.0, color: Color(AppColors.LoginLinkTextColor))),
                onTap: () {},
              ),
              Text(' | ', style: TextStyle(fontSize: 20.0, color: Color(AppColors.LoginLinkTextColor),)),
              InkWell(
                child: Text('微信安全中心', style: TextStyle(fontSize: 16.0, color: Color(AppColors.LoginLinkTextColor),)),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: 20.0,),
        ],
      ),
      
    );
  }
}