import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/widget/function_item_widget.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  
  // 分组之间的间距
  static const SEPARATE_SIZE = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置', style: AppStyles.TitleStyle,),
        // 返回图标
        leading: IconButton(
          icon: Icon(
            IconData(
              0xe64c,
              fontFamily: AppConstants.IconFontFamily,
            ),
            size: AppConstants.ActionIconSize,
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
      body: Container(
        color: Color(AppColors.BackgroundColor),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '账号与安全',
                onPressed: () {print('点击了账号与安全');},
              ),
              SizedBox(height: SEPARATE_SIZE),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '新消息提醒',
                showDivider: true,
                onPressed: () {print('点击了新消息提醒');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '勿扰模式',
                showDivider: true,
                onPressed: () {print('点击了勿扰模式');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '聊天',
                showDivider: true,
                onPressed: () {print('点击了聊天');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '隐私',
                showDivider: true,
                onPressed: () {print('点击了隐私');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '通用',
                showDivider: true,
                onPressed: () {print('点击了通用');},
              ),
              SizedBox(height: SEPARATE_SIZE),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '关于微信',
                showDivider: true,
                onPressed: () {print('点击了关于微信');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '帮助与反馈',
                onPressed: () {print('点击了帮助与反馈');},
              ),
              SizedBox(height: SEPARATE_SIZE),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '插件',
                onPressed: () {print('点击了插件');},
              ),
              SizedBox(height: SEPARATE_SIZE),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '切换账号',
                showDivider: true,
                onPressed: () {print('点击了切换账号');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '退出',
                onPressed: () {print('点击了退出');},
              ),
            ],
          ),
        ),
      ),
    );
  }
}