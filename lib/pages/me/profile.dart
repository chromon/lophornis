import 'package:flutter/material.dart';
import 'package:lophornis/constants/app_routes.dart';

import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/widget/function_item_widget.dart';

// 个人信息页
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  // 分组之间的间距
  static const SEPARATE_SIZE = 10.0;
  
  static const QR_CODE_PREVIEW_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息', style: AppStyles.TitleStyle,),
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
                title: '头像',
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FunctionItemWidget.iconTag(
                      'assets/images/default_nor_avatar.png',
                      isBig: true,
                    ),
                    SizedBox(width: 6.0,),
                  ],
                ),
                onPressed: () {print('点击了头像');},
              ),
              SizedBox(height: SEPARATE_SIZE),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '昵称',
                showDivider: true,
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FunctionItemWidget.descText('ellery'),
                    SizedBox(width: 6.0,),
                  ],
                ),
                onPressed: () {
                  print('点击了昵称');
                  Navigator.pushNamed(context, Routes.SetNickname);
                },
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '微信号',
                showDivider: true,
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FunctionItemWidget.descText('test'),
                    SizedBox(width: 6.0,),
                  ],
                ),
                onPressed: () {print('点击了微信号');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '二维码名片',
                showDivider: true,
                customWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/ic_qrcode_preview_tiny.png',
                      width: QR_CODE_PREVIEW_SIZE,
                      height: QR_CODE_PREVIEW_SIZE,
                    ),
                    SizedBox(width: 6.0,)
                  ],
                ),
                onPressed: () {print('点击了二维码名片');},
              ),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '更多',
                onPressed: () {},
              ),
              SizedBox(height: SEPARATE_SIZE),
              FunctionItemWidget(
                iconPath: '',
                showAvatar: false,
                title: '我的地址',
                showDivider: true,
                onPressed: () {print('点击了我的地址');},
              ),
            ],
          ),
        ),
      ),
    );
  }
}