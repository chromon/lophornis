import 'package:flutter/material.dart';
import '../constants.dart';

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
}

// 会话列表详细信息
const List<Conversation> mockConversations = [
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/7.jpg',
    title: 'John',
    desc: '今天一起出去玩吗？',
    updateAt: '13:38',
    isMute: true,
    unreadMsgCount: 0
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
    avatar: 'https://randomuser.me/api/portraits/lego/5.jpg',
    title: 'John',
    desc: '今天一起出去玩吗？',
    updateAt: '13:38',
    isMute: true,
    unreadMsgCount: 0
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/4.jpg',
    title: 'John',
    desc: '今天一起出去玩吗？',
    updateAt: '13:38',
    isMute: true,
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
    isMute: true,
    unreadMsgCount: 0
  ),
  const Conversation(
    avatar: 'https://randomuser.me/api/portraits/lego/1.jpg',
    title: 'John',
    desc: '今天一起出去玩吗？',
    updateAt: '13:38',
    isMute: true,
    unreadMsgCount: 0
  ),
];