import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';

// 全局样式
class AppStyles {
  // 会话标题样式
  static const TitleStyle = TextStyle(
    fontSize: 16.0,
    color: Color(AppColors.ConversationTitleColor)
  );

  // 会话描述样式
  static const DescStyle = TextStyle(
    fontSize: AppConstants.DesTextSize,
    color: Color(AppColors.ConversationDescColor)
  );

  // 未读消息角标样式
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.NotifyDotText)
  );

  // 顶部设备登录信息样式
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: AppConstants.DesTextSize,
    color: Color(AppColors.DeviceInfoItemText)
  );

  // 联系人分组标签文字样式
  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.ContactGroupTitleText)
  );

  // 索引盒子文字样式
  static const IndexLetterBoxTextStyle = TextStyle(
    fontSize: 64.0,
    color: Colors.white,
  );

  // header 标题文字样式
  static const HeaderCardTitleTextStyle = TextStyle(
    fontSize: 20.0,
    color: Color(AppColors.HeaderCardTitleText),
    fontWeight: FontWeight.bold,
  );

  // header 描述文字样式
  static const HeaderCardDescTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColors.HeaderCardDescText),
    fontWeight: FontWeight.normal
  );

  // 提示信息样式
  static const ButtonDescTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColors.ButtonDescText),
  );

  // New 标签提示信息样式
  static const NewTagTextStyle = TextStyle(
    fontSize: AppConstants.DesTextSize,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );
}