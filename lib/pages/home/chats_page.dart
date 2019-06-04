import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/modal/chats.dart';
import 'package:lophornis/widget/chat_item_widget.dart';
import 'package:lophornis/widget/device_item_widget.dart';

/*
 * 会话列表页 
 */
class ChatsPage extends StatefulWidget {
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {

  final ChatPageData data = ChatPageData.mock();

  @override
  Widget build(BuildContext context) {

    var mockChats = data.chats;

    // 构建列表
    return Container(
      color: const Color(AppColors.ChatsBg),
      child: ListView.builder(
        // 索引值为列表项的位置
        itemBuilder: (BuildContext  context, int index) {
          if (data.device != null) {
            // 需要显示其他设备登录
            if(index == 0 ) {
              return DeviceInfoItem(device: data.device,);
            }
            return ChatItem(chat: mockChats[index - 1]);
          } else {
            // 没有在其他设备登录
            return ChatItem(chat: mockChats[index]);
          }
        },
        itemCount: data.device != null ? mockChats.length + 1 : mockChats.length,
      ),
    );
  }
}