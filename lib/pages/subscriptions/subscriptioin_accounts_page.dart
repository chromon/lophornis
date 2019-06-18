import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_colors.dart';

import 'package:lophornis/modal/subscriptions.dart';
import 'package:lophornis/widget/chat_item_widget.dart';

class SubscriptionAccountsPage extends StatefulWidget {
  @override
  _SubscriptionAccountsPageState createState() => _SubscriptionAccountsPageState();
}

class _SubscriptionAccountsPageState extends State<SubscriptionAccountsPage> {

  final SubscriptionPageData data = SubscriptionPageData.mock();

  @override
  Widget build(BuildContext context) {

    var mockSubscriptions = data.subscriptions;

    return Scaffold(
      appBar: AppBar(
        title: Text('公众号', style: AppStyles.TitleStyle,),
        // 返回图标
        leading: IconButton(
          icon: Icon(
            IconData(
              0xe64c,
              fontFamily: AppConstants.IconFontFamily,
            ),
            size: AppConstants.ActionIconSize + 4.0,
            color: const Color(AppColors.ActionIconColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: const Color(AppColors.PrimaryColor),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(
                0xe65e,
                fontFamily: AppConstants.IconFontFamily,
              ),
              size: AppConstants.ActionIconSize + 4.0,
              color: const Color(AppColors.ActionIconColor),
            ),
            onPressed: () {},
          ),
          SizedBox(width: 16.0,),
        ],
      ),
      body: Container(
        color: const Color(AppColors.ChatsBg),
        child: ListView.builder(
          // 索引值为列表项的位置
          itemBuilder: (BuildContext  context, int index) {
            return ChatItem(chat: mockSubscriptions[index]);
          },
          itemCount: mockSubscriptions.length,
        ),
      ),
    );
  }
}