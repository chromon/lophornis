import 'package:flutter/material.dart';
import 'package:lophornis/constants.dart' show AppColor, AppStyles, Constants;
import '../modal/conversation.dart' show Conversation, Device, ConversationPageData;

// 会话项
class _ConversationItem extends StatelessWidget {

  final Conversation conversation;

  const _ConversationItem({Key key, this.conversation})
    : assert(conversation != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {

    // 会话头像初始化
    Widget avatar;
    if (conversation.isAvatarFromNet()) {
      // 来自网络
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Image.network(
          conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize,
        ),
      );
    } else {
      // 来自本地
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(6.0),
        child: Image.asset(
          conversation.avatar,
          width: Constants.ConversationAvatarSize,
          height: Constants.ConversationAvatarSize,
        ),
      );
    }

    // 头像及角标容器
    Widget avatarContainer;
    if (conversation.unreadMsgCount > 0) {
      // 存在未读消息
      
      // 未读消息角标
      Widget unreadMsgCountText = Container(
        width: Constants.UnreadMsgNotifyDotSize,
        height: Constants.UnreadMsgNotifyDotSize,
        alignment: Alignment.center,
        // 圆角背景
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Constants.UnreadMsgNotifyDotSize / 2.0),
          color: Color(AppColor.NotifyDotBg)
        ),
        // 未读消息数量
        child: Text(
          conversation.unreadMsgCount.toString(), 
          style: AppStyles.UnreadMsgCountDotStyle
        ),
      );

      // 堆栈布局，里面元素相互叠加，后面添加的元素会在上面
      avatarContainer = Stack(
        // 超出 stack 显示区域时也可见
        overflow: Overflow.visible,
        children: <Widget>[
          avatar,
          // 自定义角标位置
          Positioned(
            right: -6.0,
            top: -6.0,
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
            fontFamily: Constants.IconFontFamily,
          ),
          color: Color(AppColor.ConversationMuteIcon),
          size: Constants.ConversationMuteIconSize,
        )
      );
    } else {
      _rightArea.add(
        // 添加勿扰模式图标 —— 透明站位
        Icon(
          IconData(
            0xe755,
            fontFamily: Constants.IconFontFamily,
          ),
          color: Colors.transparent,
          size: Constants.ConversationMuteIconSize,
        )
      );
    }

    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
        padding: const EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0),
        // 分隔线
        decoration: BoxDecoration(
          // 会话背景颜色
          color: Color(AppColor.ConversationItemBg),
          // 会话边框
          border: Border(
            bottom: BorderSide(
              color: Color(AppColor.DividerColor),
              width: Constants.DividerWidth
            ),
          ),
        ),
        
        child: Row(
          // 主轴居中
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 头像及角标堆栈容器
            avatarContainer,
            Container(width: 10.0,),
            // 标题和简介，自动扩展
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 会话标题
                  Text(conversation.title, style: AppStyles.TitleStyle),
                  // 会话简介
                  Text(conversation.desc, style: AppStyles.DescStyle)
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
        top: 10.0,
        right: 24.0,
        bottom: 10.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: Constants.DividerWidth, color: Color(AppColor.DividerColor)),
        ),
        color: Color(AppColor.DeviceInfoItemBg)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            IconData(
              this.iconName,
              fontFamily: Constants.IconFontFamily,
            ), 
            size: 24.0,
            color: Color(AppColor.DeviceInfoItemIcon),
          ),
          SizedBox(width: 16.0,),
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
    return ListView.builder(
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
    );
  }
}