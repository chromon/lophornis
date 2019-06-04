import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_styles.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hehe', style: AppStyles.TitleStyle,),
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
          IconButton(
            icon: Icon(
              IconData(
                0xe609,
                fontFamily: AppConstants.IconFontFamily,
              ),
              size: AppConstants.ActionIconSize + 4.0,
              color: const Color(AppColors.ActionIconColor),
            ),
            onPressed: () {},
          ),
          SizedBox(width: 16.0,),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: const Color(AppColors.BackgroundColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              color: Color(AppColors.ChatBoxBg),
              border: Border(
                top: BorderSide(
                  color: const Color(AppColors.DividerColor),
                  width: AppConstants.DividerWidth,
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    IconData(
                      0xe7e2,
                      fontFamily: AppConstants.IconFontFamily,
                    ),
                    size: AppConstants.ActionIconSizeLarge,
                    color: const Color(AppColors.ActionIconColor),
                  ),
                  onPressed: () { print('语音文字切换按钮');},
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 4.0, right: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    height: AppConstants.ChatBoxHeight,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    IconData(
                      0xe60c,
                      fontFamily: AppConstants.IconFontFamily,
                    ),
                    size: AppConstants.ActionIconSizeLarge,
                    color: const Color(AppColors.ActionIconColor),
                  ),
                  onPressed: () { print('表情包按钮'); },
                ),
                IconButton(
                  icon: Icon(
                    IconData(
                      0xe616,
                      fontFamily: AppConstants.IconFontFamily,
                    ),
                    size: AppConstants.ActionIconSizeLarge,
                    color: const Color(AppColors.ActionIconColor),
                  ),
                  onPressed: () { print('添加图片按钮'); },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}