import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_styles.dart';

class FriendItem extends StatelessWidget {

  // 添加好友列表项头像
  final String iconPath;
  // 添加好友列表项标题
  final String title;
  // 添加好友列表项简介
  final String desc;
  // 添加好友列表项显示箭头
  final bool showArrow;
  // 回调
  final VoidCallback onPressed;

  FriendItem({this.iconPath, this.title, this.desc, this.showArrow = true, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Color(AppColors.ChatsItemBg),
      onPressed: this.onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
              child: Image.asset(
                this.iconPath,
                width: 42.0,
                height: 42.0,
              ),
            ),
            SizedBox(width: 12.0,),
            Expanded(
              child: Container(
                padding: const EdgeInsetsDirectional.only(top: 14.0, bottom: 14.0),
                // 分隔线
                decoration: BoxDecoration(
                  // 边框
                  border: Border(
                    bottom: BorderSide(
                      color: Color(AppColors.DividerColor),
                      width: AppConstants.DividerWidth
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // 标题
                          Text(this.title, style: AppStyles.TitleStyle),
                          SizedBox(height: 2.0,),
                          // 简介
                          Text(this.desc, style: AppStyles.DescStyle, maxLines: 1,)
                        ],
                      ),
                    ),
                    SizedBox(width: 10.0,),
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}