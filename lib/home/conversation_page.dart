import 'package:flutter/material.dart';
import 'package:lophornis/constants.dart' show AppColor, AppStyles, Constants;
import '../modal/conversation.dart' show Conversation, mockConversations;

// 会话项
class _ConversationItem extends StatelessWidget {

  final Conversation conversation;

  const _ConversationItem({Key key, this.conversation})
    : assert(conversation != null),
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
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
          // 头像
          Image.asset(
            'assets/images/default_nor_avatar.png',
            width: Constants.ConversationAvatarSize,
            height: Constants.ConversationAvatarSize,
          ),
          Container(width: 10.0,),
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
          Column(
            children: <Widget>[
              // 会话时间
              Text(conversation.updateAt, style: AppStyles.DescStyle),
            ],
          )
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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext  context, int index) {
        return _ConversationItem(conversation: mockConversations[index]);
      },
      itemCount: mockConversations.length,
    );
  }
}