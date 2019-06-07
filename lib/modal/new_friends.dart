import 'package:flutter/material.dart';

class NewFriend {
  
  // 新朋友头像
  final String avatar;
  // 新朋友标题
  final String title;
  // 新朋友信息简介
  final String desc;
  // 是否已添加
  final bool isAdd;

  // 构造方法初始化数据
  const NewFriend({
    @required this.avatar,
    @required this.title,
    this.desc,
    this.isAdd: false,
  }) : assert(avatar != null),
       assert(title != null);
  
  // 判断头像图片是否是来自网络
  bool isAvatarFromNet() {
    if (this.avatar.indexOf('http') == 0 ||
      this.avatar.indexOf('https') == 0) {
        return true;
    }
    return false;
  }
}

class NewFriendsData {

  final List<NewFriend> newFriends;

  NewFriendsData({
    this.newFriends,
  });

  static mock() {
    return NewFriendsData(newFriends: mockNewFriends);
  }

  static List<NewFriend> mockNewFriends = [
    const NewFriend(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John',
      desc: '今天一起出去玩吗？',
      isAdd: true,
    ),
    const NewFriend(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John2',
      desc: '今天一起出去玩吗？',
      isAdd: false,
    ),
    const NewFriend(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John3',
      desc: '今天一起出去玩吗？',
      isAdd: false,
    ),
    const NewFriend(
      avatar: 'assets/images/default_nor_avatar.png',
      title: 'John4',
      desc: '今天一起出去玩吗？',
      isAdd: true,
    ),
  ];
}