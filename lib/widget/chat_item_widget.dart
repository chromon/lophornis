import 'package:flutter/material.dart';

import 'package:lophornis/modal/chats.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_routes.dart';

// 会话项
class ChatItem extends StatelessWidget {

  final Chat chat;
  // 弹出菜单点击的位置
  var tapPos;

  ChatItem({Key key, this.chat, this.tapPos})
    : assert(chat != null),
    super(key: key);

  // 实现会话弹出菜单
  _showMenu(BuildContext context, Offset tapPos) {
    // 屏幕大小
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    final RelativeRect position = RelativeRect.fromLTRB(tapPos.dx, tapPos.dy,
        overlay.size.width - tapPos.dx, overlay.size.height - tapPos.dy);
    showMenu<String>(
        context: context,
        position: position,
        items: <PopupMenuItem<String>>[
          PopupMenuItem(
            child: Text(AppConstants.MENU_MARK_AS_UNREAD_VALUE),
            value: AppConstants.MENU_MARK_AS_UNREAD,
          ),
          PopupMenuItem(
            child: Text(AppConstants.MENU_PIN_TO_TOP_VALUE),
            value: AppConstants.MENU_PIN_TO_TOP,
          ),
          PopupMenuItem(
            child: Text(AppConstants.MENU_DELETE_CONVERSATION_VALUE),
            value: AppConstants.MENU_DELETE_CONVERSATION,
          ),
        ]).then<String>((String selected) {
      switch (selected) {
        default:
          print('当前选中的是：$selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    // 会话头像初始化
    Widget avatar;
    if (chat.isAvatarFromNet()) {
      // 来自网络
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
        child: Image.network(
          chat.avatar,
          width: AppConstants.ConversationAvatarSize,
          height: AppConstants.ConversationAvatarSize,
        ),
      );
    } else {
      // 来自本地
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
        child: Image.asset(
          chat.avatar,
          width: AppConstants.ConversationAvatarSize,
          height: AppConstants.ConversationAvatarSize,
        ),
      );
    }

    // 头像及角标容器
    Widget avatarContainer;
    if (chat.unreadMsgCount > 0) {
      // 存在未读消息
      
      // 未读消息角标
      Widget unreadMsgCountText;
      if (chat.displayDot) {
        unreadMsgCountText = Container(
          width: AppConstants.UnreadMsgDotSize,
          height: AppConstants.UnreadMsgDotSize,
          alignment: Alignment.center,
          // 圆角背景
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.UnreadMsgDotSize / 2.0),
            color: Color(AppColors.NotifyDotBg)
          ),
        );
      } else {
        unreadMsgCountText = Container(
          width: AppConstants.UnreadMsgCircleDotSize,
          height: AppConstants.UnreadMsgCircleDotSize,
          alignment: Alignment.center,
          // 圆角背景
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.UnreadMsgCircleDotSize / 2.0),
            color: Color(AppColors.NotifyDotBg)
          ),
          // 未读消息数量
          child: Text(
            chat.unreadMsgCount.toString(), 
            style: AppStyles.UnreadMsgCountDotStyle
          ),
        );
      }

      // 堆栈布局，里面元素相互叠加，后面添加的元素会在上面
      avatarContainer = Stack(
        // 超出 stack 显示区域时也可见
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          // 自定义角标位置
          Positioned(
            right: chat.displayDot ? -4.0 : -6.0,
            top: chat.displayDot ? -4.0 : -6.0,
            child: unreadMsgCountText,
          )
        ],
      );
    } else {
      // 不存在未读消息
      // 只显示头像
      avatarContainer = avatar;
    }

    // 会话 item 右边部分，包括时间和勿扰图标
    var _rightArea = <Widget>[
      // 会话时间
      Text(chat.updateAt, style: AppStyles.DescStyle),
      Container(height: 10.0),
      // 定义一个空白盒子用于站位，功能同上
      // SizedBox(height: 10.0)
    ];

    // 判断是否是勿扰模式
    if (chat.isMute) {
      _rightArea.add(
        // 添加勿扰模式图标 —— 正常
        Icon(
          IconData(
            0xe755,
            fontFamily: AppConstants.IconFontFamily,
          ),
          color: Color(AppColors.ChatsMuteIcon),
          size: AppConstants.ChatsMuteIconSize,
        )
      );
    } else {
      _rightArea.add(
        // 添加勿扰模式图标 —— 透明站位
        Icon(
          IconData(
            0xe755,
            fontFamily: AppConstants.IconFontFamily,
          ),
          color: Colors.transparent,
          size: AppConstants.ChatsMuteIconSize,
        )
      );
    }

    return Material(
      // 会话背景颜色
      color: Color(AppColors.ChatsItemBg),
      child: InkWell(
        onTap: () {
          // 跳转到聊天页面
          print('打开，${chat.title}');
          Navigator.pushNamed(context, Routes.Chat);
        },
        onTapDown: (TapDownDetails details) {
          // 点击位置
          tapPos = details.globalPosition;
        },
        onLongPress: () {
          // 显示弹出菜单
          _showMenu(context, tapPos);
        },
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
 
            child: Row(
              // 交叉轴居中
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 头像及角标堆栈容器
                avatarContainer,
                Container(width: 12.0,),
                // 标题和简介，自动扩展
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 14.0, bottom: 14.0),
                    // 分隔线
                    decoration: BoxDecoration(
                      // 会话边框
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
                              // 会话标题
                              Text(chat.title, style: AppStyles.TitleStyle),
                              SizedBox(height: 2.0,),
                              // 会话简介
                              Text(chat.desc, style: AppStyles.DescStyle, maxLines: 1,)
                            ],
                          ),
                        ),
                        Container(width: 10.0,),
                        // 时间及勿扰图标
                        Column(
                          children: _rightArea,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}