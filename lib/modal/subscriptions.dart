import 'package:lophornis/modal/chats.dart';

// 订阅号数据
class SubscriptionPageData {

  final List<Chat> subscriptions;

  const SubscriptionPageData({
    this.subscriptions,
  });

  static mock() {
    return SubscriptionPageData(
      subscriptions: mockSubscriptions);
  }

  // 会话列表详细信息
  static List<Chat> mockSubscriptions = [
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