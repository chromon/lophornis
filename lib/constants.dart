/*
 * 全局常量定义
 */

// 全局颜色定义
import 'package:flutter/material.dart';

class AppColor {
  // 背景颜色
  static const BackgroundColor = 0xffebebeb;
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
  // 通知角标背景颜色
  static const NotifyDotBg = 0xffff3e3d;
  // 通知角标文字颜色
  static const NotifyDotText = 0xffffffff;
  // 会话勿扰模式图标颜色
  static const ConversationMuteIcon = 0xffd8d8d8;
  // 顶部设备登录信息背景颜色
  static const DeviceInfoItemBg = 0xfff5f5f5;
  // 顶部设备登录信息字体颜色
  static const DeviceInfoItemText = 0xff606062;
  // 顶部设备登录信息图标颜色
  static const DeviceInfoItemIcon = 0xff606062;

  // 联系人分组标签背景颜色
  static const ContactGroupTitleBg = 0xffebebeb;
  //联系人分组标签文字颜色
  static const ContactGroupTitleText = 0xff888888;
  // 索引条字母显示盒子背景颜色
  static const IndexLetterBoxBg = Colors.black45;

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

  // 未读消息角标样式
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColor.NotifyDotText)
  );

  // 顶部设备登录信息样式
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: 13.0,
    color: Color(AppColor.DeviceInfoItemText)
  );

  // 联系人分组标签文字样式
  static const GroupTitleItemTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColor.ContactGroupTitleText)
  );

  // 索引盒子文字样式
  static const IndexLetterBoxTextStyle = TextStyle(
    fontSize: 64.0,
    color: Colors.white,
  );

  // 
  static const FullWidthIconButtonTitleStyle = TextStyle(

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
  // 未读消息圆点大小
  static const UnreadMsgNotifyDotSize = 20.0;
  // 会话勿扰模式图标大小
  static const ConversationMuteIconSize = 18.0;
  // 顶部设备登录信息高度
  static const DeviceInfoItemHeight = 32.0;

  // 联系人头像大小
  static const ContactAvatarSize = 36.0;
  // 索引栏宽度
  static const IndexBarWidth = 32.0;
  // 索引栏字母显示盒子大小
  static const IndexLetterBoxSize = 114.0;
  // 索引栏字母盒子圆角
  static const IndexLetterBoxRadius = 4.0;
  
  // 发现页列表项图标大小
  static const ICON_SIZE = 24.0;
  // 发现页列表项水平边距
  static const HORIZONTAL_PADDING = 20.0;
  // 发现页列表项垂直边距
  static const VERTICAL_PADDING = 13.0;
  //
  static const FullWidthIconButtonIconSize = 24.0;
}