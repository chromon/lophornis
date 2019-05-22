/*
 * 全局常量定义
 */

// 全局颜色定义
import 'package:flutter/material.dart';

class AppColor {
  // 顶部 app bar 颜色
  static const AppBarColor = 0xff303030;
  // 底部 tab 高亮状态颜色
  static const TabIconActive = 0xff46c11b;
  // 底部 tab 正常状态颜色
  static const TabIconNormal = 0xff999999;
  // 顶部 appbar 弹出菜单背景颜色 
  static const AppBarPopupMenuColor = 0xffffffff;
  // 会话标题默认颜色
  static const ConversationTitleColor = 0xff353535;
  // 会话简介默认颜色
  static const ConversationDescColor = 0xff9e9e9e;
  // 会话默认背景颜色
  static const ConversationItemBg = 0xffffffff;
  // 会话分隔线颜色
  static const DividerColor = 0xffd9d9d9;
}

// 全局样式
class AppStyles {
  // 会话标题样式
  static const TitleStyle = TextStyle(
    fontSize: 16.0,
    color: Color(AppColor.ConversationTitleColor)
  );

  // 会话描述样式
  static const DescStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColor.ConversationDescColor)
  );
}

// 全局常量
class Constants {
  // 字体常量
  static const IconFontFamily = "appIconFont";
  // 会话头像大小
  static const ConversationAvatarSize = 48.0;
  // 会话分隔线宽度
  static const DividerWidth = 1.0;
}