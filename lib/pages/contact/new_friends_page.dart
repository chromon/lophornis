import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_routes.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/modal/new_friends.dart';
import 'package:lophornis/widget/new_friend_item_widget.dart';

class NewFriendsPage extends StatefulWidget {
  @override
  _NewFriendsPageState createState() => _NewFriendsPageState();
}

class _NewFriendsPageState extends State<NewFriendsPage> {

  // 控制器，监听输入框的输入
  final TextEditingController _controller = new TextEditingController();
  
  // 分组索引项高度
  static const double INDEX_ITEM_HEIGHT = 34.0;

  NewFriendsData data = NewFriendsData.mock();

  @override
  Widget build(BuildContext context) {

    var mockNewFriends = data.newFriends;

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
        actions: <Widget>[
          // 添加朋友按钮
          FlatButton(
            child: Text('添加朋友', style: AppStyles.TitleStyle,),
            onPressed: () {
              Navigator.pushNamed(context, Routes.AddFriends);
            },
          ),
        ],
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
              Container(
                height: 48.0,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: AppConstants.DividerWidth, color: const Color(AppColors.DividerColor))
                  ),
                ),
                // 添加手机联系人按钮
                child: FlatButton(
                  color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/ic_phone.png',
                        color: const Color(AppColors.NewPhoneContact),
                        width: AppConstants.FullWidthIconButtonIconSize,
                        height: AppConstants.FullWidthIconButtonIconSize,
                      ),
                      Expanded(
                        child: Container(
                          height: 18.0,
                          child: Text('添加手机联系人', style: AppStyles.TitleStyle),
                          padding: EdgeInsets.only(
                            left: AppConstants.NewPhoneContact_PADDING,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(
                          IconData(
                            0xe604,
                            fontFamily: AppConstants.IconFontFamily,
                          ),
                          size: 16.0,
                          color: const Color(AppColors.ButtonDescText)
                        )
                      )
                    ],
                  ),
                  onPressed: () { print('手机联系人'); },
                ),
              ),
              // 新朋友列表
              Container(
                child: Column(
                  children: <Widget>[
                    // 分组标签
                    Container(
                      height: INDEX_ITEM_HEIGHT,
                      padding: EdgeInsets.only(left: 16.0, right: 16.0),
                      color: Color(AppColors.ContactGroupTitleBg),
                      alignment: Alignment.centerLeft,
                      child: Text('三天前', style: AppStyles.GroupTitleItemTextStyle,)
                    ),
                    // 新朋友列表
                    ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return NewFriendItem(newFriend: mockNewFriends[index],);
                      },
                      itemCount: mockNewFriends.length,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}