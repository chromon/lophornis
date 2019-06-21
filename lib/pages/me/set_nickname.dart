import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';

class SetNicknamePage extends StatefulWidget {
  @override
  _SetNicknamePageState createState() => _SetNicknamePageState();
}

class _SetNicknamePageState extends State<SetNicknamePage> {


  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('更改名字', style: AppStyles.TitleStyle,),
        // 返回图标
        leading: IconButton(
          icon: Icon(
            IconData(
              0xe64c,
              fontFamily: AppConstants.IconFontFamily,
            ),
            size: AppConstants.ActionIconSize + 4.0,
            color: const Color(AppColors.ActionIconColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: const Color(AppColors.PrimaryColor),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: MaterialButton(
              color: Color(AppColors.MainColor),
              height: 18.0,
              child: Text('保存', style: TextStyle(fontSize: 14.0, color: Colors.white),),
              onPressed: () {
              },
            ),
          ),
          SizedBox(width: 16.0,),
        ],
      ),
      body: Container(
        color: Color(AppColors.PrimaryColor),
        child: TextField(
          controller: _controller,
          decoration: new InputDecoration(
            hintText: '昵称',
            // 输入框背景颜色
            fillColor: Colors.white,
            filled: true,
            // 输入框边框
            border: InputBorder.none,
          ),
          cursorColor: Colors.grey,
        ),
      ),
    );
  }
}