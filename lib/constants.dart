/*
 * 全局常量定义
 */

// 全局颜色定义
import 'package:flutter/material.dart';

class AppColor {
  // ---------------------- 首页 ----------------------
  // 主题颜色
  static const PrimaryColor = 0xffebebeb;
  // 背景颜色
  static const BackgroundColor = 0xffededed;
  // 顶部 app bar 颜色
  static const AppBarColor = 0xffededed;
  // 顶部图标颜色
  static const ActionIconColor = 0xff000000;
  // 顶部弹出菜单背景颜色
  static const ActionMenuBgColor = 0xff4c4c4c;
  // 卡片背景颜色
  static const CardBgColor = 0xffffffff;
  // 底部 tab 高亮状态颜色
  static const TabIconActive = 0xff46c11b;
  // 底部 tab 正常状态颜色
  static const TabIconNormal = 0xff999999;
  // 顶部 appbar 弹出菜单背景颜色 
  static const AppBarPopupMenuColor = 0xffffffff;

  // ---------------------- 会话页 ----------------------
  // 会话标题默认颜色
  static const ConversationTitleColor = 0xff181818;
  // 会话简介默认颜色
  static const ConversationDescColor = 0xff9e9e9e;
  // 会话默认背景颜色
  static const ConversationItemBg = 0xffffffff;
  // 会话分隔线颜色
  static const DividerColor = 0xffd5d5d5;
  // 通知角标背景颜色
  static const NotifyDotBg = 0xffff3e3d;
  // 通知角标文字颜色
  static const NotifyDotText = 0xffffffff;
  // 会话勿扰模式图标颜色
  static const ConversationMuteIcon = 0xffd8d8d8;
  // 顶部设备登录信息背景颜色
  static const DeviceInfoItemBg = 0xffededed;
  // 顶部设备登录信息字体颜色
  static const DeviceInfoItemText = 0xff606062;
  // 顶部设备登录信息图标颜色
  static const DeviceInfoItemIcon = 0xff606062;

  // ---------------------- 联系人页 ----------------------
  // 联系人分组标签背景颜色
  static const ContactGroupTitleBg = 0xffebebeb;
  //联系人分组标签文字颜色
  static const ContactGroupTitleText = 0xff888888;
  // 索引条字母显示盒子背景颜色
  static const IndexLetterBoxBg = Colors.black45;

  // ---------------------- 个人主页 ----------------------
  // 个人页面 header 背景颜色
  static const HeaderCardBg = Colors.white;
  // header 标题文字颜色
  static const HeaderCardTitleText = 0xff353535;
  // header 描述文字颜色
  static const HeaderCardDescText = 0xffa9a9a9;
  // 提示信息字体颜色
  static const ButtonDescText = 0xffa9a9a9;
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
    fontSize: Constants.DesTextSize,
    color: Color(AppColor.ConversationDescColor)
  );

  // 未读消息角标样式
  static const UnreadMsgCountDotStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColor.NotifyDotText)
  );

  // 顶部设备登录信息样式
  static const DeviceInfoItemTextStyle = TextStyle(
    fontSize: Constants.DesTextSize,
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

  // header 标题文字样式
  static const HeaderCardTitleTextStyle = TextStyle(
    fontSize: 14.0,
    color: Color(AppColor.HeaderCardTitleText),
  );

  // header 描述文字样式
  static const HeaderCardDescTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColor.HeaderCardDescText)
  );

  // 提示信息样式
  static const ButtonDescTextStyle = TextStyle(
    fontSize: 12.0,
    color: Color(AppColor.ButtonDescText),
  );
}

// 全局常量
class Constants {
  // 字体常量
  static const IconFontFamily = "appIconFont";
  // tab 状态栏图标大小
  static const ActionIconSize = 20.0;
  // 头像圆角大小
  static const AvatarRadius = 6.0;
  // 简介文字大小
  static const DesTextSize = 13.0;
  // 会话头像大小
  static const ConversationAvatarSize = 48.0;
  // 会话分隔线宽度
  static const DividerWidth = 1.0;
  // 未读消息数字圆大小
  static const UnreadMsgCircleDotSize = 20.0;
  // 未读消息红点大小
  static const UnreadMsgDotSize = 12.0;
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
  // 图标大小
  static const FullWidthIconButtonIconSize = 24.0;

  // 会话 item 弹出菜单
  static const String MENU_MARK_AS_UNREAD = 'MENU_MARK_AS_UNREAD';
  static const String MENU_MARK_AS_UNREAD_VALUE = '标为未读';
  static const String MENU_PIN_TO_TOP = 'MENU_PIN_TO_TOP';
  static const String MENU_PIN_TO_TOP_VALUE = '置顶聊天';
  static const String MENU_DELETE_CONVERSATION = 'MENU_DELETE_CONVERSATION';
  static const String MENU_DELETE_CONVERSATION_VALUE = '删除该聊天';
  static const String MENU_PIN_PA_TO_TOP = 'MENU_PIN_PA_TO_TOP';
  static const String MENU_PIN_PA_TO_TOP_VALUE = '置顶公众号';
  static const String MENU_UNSUBSCRIBE = 'MENU_UNSUBSCRIBE';
  static const String MENU_UNSUBSCRIBE_VALUE = '取消关注';
}