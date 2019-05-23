import 'package:flutter/material.dart';
import '../constants.dart';

enum Device {
  MAC, WIN
}

// 会话
class Conversation {

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

  // 构造方法初始化数据
  const Conversation({
    @required this.avatar,
    @required this.title,
    this.titleColor: AppColor.ConversationTitleColor,
    this.desc,
    @required this.updateAt,
    this.isMute: false,
    this.unreadMsgCount: 0,
    this.displayDot: false
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

class ConversationPageData {

  final Device device;
  final List<Conversation> conversations;

  const ConversationPageData({
    this.device,
    this.conversations,
  });

  static mock() {
    return ConversationPageData(
        device: Device.WIN, conversations: mockConversations);
  }

  // 会话列表详细信息
  static List<Conversation> mockConversations = [
    const Conversation(
      avatar: 'assets/images/ic_tx_news.png',
      title: '腾讯新闻',
      desc: '豪车与出租车刮擦 俩车主划拳定责',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 10
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/6.jpg',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: true,
      unreadMsgCount: 0
    ),
    const Conversation(
      avatar: 'assets/images/ic_wx_games.png',
      title: '微信游戏',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 3
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/4.jpg',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 0
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/3.jpg',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: true,
      unreadMsgCount: 0
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/2.jpg',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 30
    ),
    const Conversation(
      avatar: 'https://randomuser.me/api/portraits/lego/1.jpg',
      title: 'John',
      desc: '今天一起出去玩吗？',
      updateAt: '13:38',
      isMute: false,
      unreadMsgCount: 0
    ),
  ];

}