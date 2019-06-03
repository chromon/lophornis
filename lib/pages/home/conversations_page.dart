import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/modal/conversation.dart' show ConversationPageData;
import 'package:lophornis/widget/conversation_item_widget.dart';
import 'package:lophornis/widget/device_item_widget.dart';

/*
 * 会话列表页 
 */
class ConversationsPage extends StatefulWidget {
  _ConversationsPageState createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {

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
              return DeviceInfoItem(device: data.device,);
            }
            return ConversationItem(conversation: mockConversations[index - 1]);
          } else {
            // 没有在其他设备登录
            return ConversationItem(conversation: mockConversations[index]);
          }
        },
        itemCount: data.device != null ? mockConversations.length + 1 : mockConversations.length,
      ),
    );
  }
}