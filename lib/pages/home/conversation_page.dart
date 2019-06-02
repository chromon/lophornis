import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app.routes.dart';
import 'package:lophornis/modal/conversation.dart' show Conversation, Device, ConversationPageData;

// 会话项
class _ConversationItem extends StatelessWidget {

  final Conversation conversation;
  // 弹出菜单点击的位置
  var tapPos;

  _ConversationItem({Key key, this.conversation, this.tapPos})
    : assert(conversation != null),
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
    if (conversation.isAvatarFromNet()) {
      // 来自网络
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
        child: Image.network(
          conversation.avatar,
          width: AppConstants.ConversationAvatarSize,
          height: AppConstants.ConversationAvatarSize,
        ),
      );
    } else {
      // 来自本地
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
        child: Image.asset(
          conversation.avatar,
          width: AppConstants.ConversationAvatarSize,
          height: AppConstants.ConversationAvatarSize,
        ),
      );
    }

    // 头像及角标容器
    Widget avatarContainer;
    if (conversation.unreadMsgCount > 0) {
      // 存在未读消息
      
      // 未读消息角标
      Widget unreadMsgCountText;
      if (conversation.displayDot) {
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
            conversation.unreadMsgCount.toString(), 
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
            right: conversation.displayDot ? -4.0 : -6.0,
            top: conversation.displayDot ? -4.0 : -6.0,
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
      Text(conversation.updateAt, style: AppStyles.DescStyle),
      Container(height: 10.0),
      // 定义一个空白盒子用于站位，功能同上
      // SizedBox(height: 10.0)
    ];

    // 判断是否是勿扰模式
    if (conversation.isMute) {
      _rightArea.add(
        // 添加勿扰模式图标 —— 正常
        Icon(
          IconData(
            0xe755,
            fontFamily: AppConstants.IconFontFamily,
          ),
          color: Color(AppColors.ConversationMuteIcon),
          size: AppConstants.ConversationMuteIconSize,
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
          size: AppConstants.ConversationMuteIconSize,
        )
      );
    }

    return Material(
      // 会话背景颜色
      color: Color(AppColors.ConversationItemBg),
      child: InkWell(
        onTap: () {
          // 跳转到聊天页面
          print('打开，${conversation.title}');
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
                    padding: const EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0),
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
                              Text(conversation.title, style: AppStyles.TitleStyle),
                              SizedBox(height: 2.0,),
                              // 会话简介
                              Text(conversation.desc, style: AppStyles.DescStyle, maxLines: 1,)
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

/*
 *  顶部设备登录状态控件
 */
class _DeviceInfoItem extends StatelessWidget {

  // 登录设备的类型
  final Device device;

  const _DeviceInfoItem({this.device: Device.WIN}) :
    assert(device != null);

  // 判断登录设备的类型选择不同的图标
  int get iconName {
    return device == Device.WIN ? 0xe6b3 : 0xe61c;
  }

  // 判断登录设备的系统类型
  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.0,
        top: 14.0,
        right: 24.0,
        bottom: 14.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: AppConstants.DividerWidth, color: Color(AppColors.DividerColor)),
          bottom: BorderSide(width: AppConstants.DividerWidth, color: Color(AppColors.DividerColor)),
        ),
        color: Color(AppColors.DeviceInfoItemBg)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 8.0,),
          Icon(
            IconData(
              this.iconName,
              fontFamily: AppConstants.IconFontFamily,
            ), 
            size: 24.0,
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          SizedBox(width: 24.0,),
          Text('$deviceName 微信已登录，手机通知已关闭。', style: AppStyles.DeviceInfoItemTextStyle,)
        ],
      ),
    );
  }
}

/*
 * 会话列表页 
 */
class ConversationPage extends StatefulWidget {
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {


  final ConversationPageData data = ConversationPageData.mock();

  @override
  Widget build(BuildContext context) {

    var mockConversations = data.conversations;

    // 构建列表
    return Container(
      color: const Color(AppColors.ConversationBg),
      child: ListView.builder(
        // 索引值为列表项的位置
        itemBuilder: (BuildContext  context, int index) {
          if (data.device != null) {
            // 需要显示其他设备登录
            if(index == 0 ) {
              return _DeviceInfoItem(device: data.device,);
            }
            return _ConversationItem(conversation: mockConversations[index - 1]);
          } else {
            // 没有在其他设备登录
            return _ConversationItem(conversation: mockConversations[index]);
          }
        },
        itemCount: data.device != null ? mockConversations.length + 1 : mockConversations.length,
      ),
    );
  }
}