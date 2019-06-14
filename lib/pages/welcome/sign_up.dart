import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_routes.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  
  // 文本控制器
  TextEditingController nicknameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 设置顶部状态栏透明
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: const Color(AppColors.PrimaryColor),
      appBar: AppBar(
        title: Text(''),
        // 返回图标
        leading: IconButton(
          icon: Image.asset(
            'assets/images/ic_close.png',
            height: AppConstants.ActionIconSize + 4.0,
            width: AppConstants.ActionIconSize + 4.0,
            color: const Color(AppColors.ActionIconColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: const Color(AppColors.PrimaryColor),
      ),
      body: SingleChildScrollView(
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
                  child: Text('手机号注册', style: AppStyles.LoginTitleStyle,),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('昵称 ', style: TextStyle(fontSize: 20.0, color: Color(AppColors.ActionIconColor),)),
                    Expanded(
                      child: 
                        TextField(
                          controller: nicknameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          cursorColor: Color(AppColors.MainColor),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  children: <Widget>[
                    Text('国家/地区', style: TextStyle(fontSize: 20.0),),
                    FlatButton(
                      child: Text('中国（+86）', style: TextStyle(fontSize: 20.0, color: Color(AppColors.MainColor)),),
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('手机号 ', style: TextStyle(fontSize: 20.0, color: Color(AppColors.ActionIconColor),)),
                    Expanded(
                      child: 
                        TextField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          cursorColor: Color(AppColors.MainColor),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('密码 ', style: TextStyle(fontSize: 20.0, color: Color(AppColors.ActionIconColor),)),
                    Expanded(
                      child: 
                        TextField(
                          controller: passController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5.0),
                          ),
                          cursorColor: Color(AppColors.MainColor),
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 40.0,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        color: Color(AppColors.MainColor),
                        height: 48.0,
                        child: Text('注册', style: TextStyle(fontSize: 22.0, color: Colors.white),),
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, Routes.Home, (Route<dynamic> route) => false);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text('点击上面的“注册”按钮，即表示你同意', style: TextStyle(fontSize: 14.0, color: Color(AppColors.LoginLinkTextColor),)),
                    InkWell(
                      child: Text('《微信软件许可及服务协议》', style: TextStyle(fontSize: 14.0, color: Color(AppColors.LoginLinkTextColor),)),
                      onTap: () {},
                    ),
                    Text('和', style: TextStyle(fontSize: 14.0, color: Color(AppColors.LoginLinkTextColor),)),
                    InkWell(
                      child: Text('《微信隐私保护指引》', style: TextStyle(fontSize: 14.0, color: Color(AppColors.LoginLinkTextColor),)),
                      onTap: () {},
                    ),],
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}