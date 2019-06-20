import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/widget/friend_item_widget.dart';

class AddFriendsPage extends StatefulWidget {
  @override
  _AddFriendsPageState createState() => _AddFriendsPageState();
}

class _AddFriendsPageState extends State<AddFriendsPage> {

  // 控制器，监听输入框的输入
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新的朋友', style: AppStyles.TitleStyle,),
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
      ),
      body: Container(
        color: Color(AppColors.BackgroundColor),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // 搜索输入框
              new TextField(
                controller: _controller,
                decoration: new InputDecoration(
                  hintText: '微信号/手机号',
                  prefixIcon: Icon(
                    IconData(
                      0xe65e,
                      fontFamily: AppConstants.IconFontFamily,
                    ),
                    size: AppConstants.ActionIconSize,
                    color: const Color(AppColors.ActionIconColor),
                  ),
                  // 输入框背景颜色
                  fillColor: Colors.white,
                  filled: true,
                  // 输入框边框
                  border: InputBorder.none,
                ),
                cursorColor: Colors.grey,
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('我的微信号：test', style: AppStyles.DescStyle,),
                  SizedBox(width: 10.0,),
                  Image.asset(
                    'assets/images/ic_qrcode.png',
                    width: 20.0,
                    height: 20.0,
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              FriendItem(
                iconPath: 'assets/images/ic_subscription.png',
                title: '雷达加朋友',
                desc: '添加身边的朋友',
                showArrow: true,
                onPressed: () {
                  print('点击的是雷达按钮。');
                },
              ),
              FriendItem(
                iconPath: 'assets/images/ic_group_chat.png',
                title: '面对面建群',
                desc: '与身边的朋友进入同一个群聊',
                showArrow: true,
                onPressed: () {
                  print('点击的是面对面建群按钮。');
                },
              ),
              FriendItem(
                iconPath: 'assets/images/ic_quick_scan.png',
                title: '扫一扫',
                desc: '扫描二维码名片',
                showArrow: true,
                onPressed: () {
                  print('点击的是扫一扫按钮。');
                },
              ),
              FriendItem(
                iconPath: 'assets/images/ic_new_friend.png',
                title: '手机联系人',
                desc: '添加或邀请通讯录中的朋友',
                showArrow: true,
                onPressed: () {
                  print('点击的是联系人按钮。');
                },
              ),
              FriendItem(
                iconPath: 'assets/images/ic_public_account.png',
                title: '公众号',
                desc: '获取更多资源和服务',
                showArrow: true,
                onPressed: () {
                  print('点击的是公众号按钮。');
                },
              ),
              FriendItem(
                iconPath: 'assets/images/ic_subscription.png',
                title: '企业微信联系人',
                desc: '通过手机号搜索企业微信用户',
                showArrow: true,
                onPressed: () {
                  print('点击的是企业微信按钮。');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}