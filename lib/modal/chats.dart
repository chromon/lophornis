import 'package:flutter/material.dart';
import 'package:lophornis/constants/app_colors.dart';

enum Device {
  MAC, WIN
}

// 会话
class Chat {

  // 会话头像
  final String avatar;
  // 会话标题
  final String title;
  // 会话信息简介
  final String desc;
  // 会话创建时间
  final String updateAt;
  // 是否消息免打扰
  final bool isMute;
  // 会话类型不同而显示不同颜色
  final int titleColor;
  // 未读消息数量
  final int unreadMsgCount;
  // 是否以圆点形式显示未读消息
  final bool displayDot;
  // 是否是公众号
  final bool isSubscription;

  // 构造方法初始化数据
  const Chat({
    @required this.avatar,
    @required this.title,
    this.titleColor: AppColors.ChatsTitleColor,
    this.desc,
    @required this.updateAt,
    this.isMute: false,
    this.unreadMsgCount: 0,
    this.displayDot: false,
    this.isSubscription: false,
  }) : assert(avatar != null),
       assert(title != null),
       assert(updateAt != null);

  // 判断头像图片是否是来自网络
  bool isAvatarFromNet() {
    if (this.avatar.indexOf('http') == 0 ||
      this.avatar.indexOf('https') == 0) {
        return true;
    }
    return false;
  }
}

// 会话数据
class ChatPageData {

  final Device device;
  final List<Chat> chats;

  const ChatPageData({
    this.device,
    this.chats,
  });

  static mock() {
    return ChatPageData(
        // device: Device.WIN, conversations: mockConversations);
        device: null, chats: mockChats);
  }

  // 会话列表详细信息
  static List<Chat> mockChats = [
    const Chat(
      avatar: 'assets/images/ic_subscription.png',
      title: '订阅号',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: true,
      unreadMsgCount: 0,
      isSubscription: true,
    ),
    const Chat(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      desc: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 10
    ),
    const Chat(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 2,
      displayDot: true,
    ),
    const Chat(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 0
    ),
    const Chat(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: true,
      unreadMsgCount: 0
    ),
    const Chat(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 30
    ),
    const Chat(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 0
    ),
  ];

}