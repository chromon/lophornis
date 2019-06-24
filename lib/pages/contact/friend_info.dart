import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_styles.dart';

class FriendInfo extends StatefulWidget {
  @override
  _FriendInfoState createState() => _FriendInfoState();
}

class _FriendInfoState extends State<FriendInfo> {

  static const AVATAR_SIZE = 64.0;
  static const SEPARATOR_SIZE = 16.0;
  static const QR_CODE_PREVIEW_SIZE = 20.0;
  // 列表项高度
  static const HEIGHT = AppConstants.FullWidthIconButtonIconSize + AppConstants.VERTICAL_PADDING * 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('', style: AppStyles.TitleStyle,),
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
        backgroundColor: AppColors.HeaderCardBg,
        actions: <Widget>[
          FlatButton(
            child: Icon(
              IconData(
                0xe634,
                fontFamily: AppConstants.IconFontFamilyExtra,
              ),
              size: 16.0,
              color: const Color(AppColors.ButtonDescText)
            ),
            onPressed: () {
            },
          ),
          SizedBox(width: 16.0,),
        ],
      ),
      body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              print('打开，个人信息.');
            },
            color: AppColors.HeaderCardBg,
            padding: const EdgeInsets.only(
              left: 32.0,
              right: AppConstants.HORIZONTAL_PADDING,
              top: 30.0,
              bottom: 42.0
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.asset(
                    'assets/images/default_nor_avatar.png',
                    width: AVATAR_SIZE,
                    height: AVATAR_SIZE,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                          left: SEPARATOR_SIZE,
                          bottom: 5.0,
                        ),
                        child: Text('test', style: AppStyles.HeaderCardTitleTextStyle,),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.only(left: SEPARATOR_SIZE),
                              child: Text('微信号：heheh', style: AppStyles.HeaderCardDescTextStyle,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
          // 标签
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: const Color(AppColors.DividerColor),
                  width: AppConstants.DividerWidth
                ),
              ),
            ),
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                left: AppConstants.HORIZONTAL_PADDING,
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('标签', style: AppStyles.TitleStyle,),
                  Expanded(
                    child: Container(
                      height: HEIGHT,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 30.0),
                            child: Text('嗷呜呜~', style: AppStyles.ButtonDescTextStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      IconData(
                        0xe604,
                        fontFamily: AppConstants.IconFontFamily,
                      ),
                      size: 16.0,
                      color: const Color(AppColors.ButtonDescText)
                    )
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SEPARATOR_SIZE),
          // 朋友圈
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                left: AppConstants.HORIZONTAL_PADDING,
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('朋友圈', style: AppStyles.TitleStyle,),
                  Expanded(
                    child: Container(
                      height: 70.0,
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/ic_social_circle_img.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                            SizedBox(width: 10.0,),
                            Image.asset(
                              'assets/images/ic_social_circle_img.png',
                              width: 50.0,
                              height: 50.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      IconData(
                        0xe604,
                        fontFamily: AppConstants.IconFontFamily,
                      ),
                      size: 16.0,
                      color: const Color(AppColors.ButtonDescText)
                    )
                  ),
                ],
              ),
            ),
          ),
          // 更多信息
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: const Color(AppColors.DividerColor),
                  width: AppConstants.DividerWidth
                ),
              ),
            ),
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                left: AppConstants.HORIZONTAL_PADDING,
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('更多信息', style: AppStyles.TitleStyle,),
                  Expanded(
                    child: Container(
                      height: HEIGHT,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(
                        IconData(
                          0xe604,
                          fontFamily: AppConstants.IconFontFamily,
                        ),
                        size: 16.0,
                        color: const Color(AppColors.ButtonDescText)
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: SEPARATOR_SIZE,),
          // 发消息
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                left: AppConstants.HORIZONTAL_PADDING,
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: HEIGHT,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      IconData(
                        0xe6d7,
                        fontFamily: AppConstants.IconFontFamilyExtra,
                      ),
                      size: 16.0,
                      color: Colors.lightBlue,
                    )
                  ),
                  SizedBox(width: 10.0,),
                  Text('发消息', style: AppStyles.FriendInfoStyle,),
                ],
              ),
            ),
          ),
          // 音视频通话
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: const Color(AppColors.DividerColor),
                  width: AppConstants.DividerWidth
                ),
              ),
            ),
            child: FlatButton(
              onPressed: () {},
              padding: EdgeInsets.only(
                left: AppConstants.HORIZONTAL_PADDING,
              ),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: HEIGHT,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      IconData(
                        0xe644,
                        fontFamily: AppConstants.IconFontFamilyExtra,
                      ),
                      size: 16.0,
                      color: Colors.lightBlue
                    )
                  ),
                  SizedBox(width: 20.0,),
                  Text('音视频通话', style: AppStyles.FriendInfoStyle,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}