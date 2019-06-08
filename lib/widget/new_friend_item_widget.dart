import 'package:flutter/material.dart';

import 'package:lophornis/modal/new_friends.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_styles.dart';

class NewFriendItem extends StatefulWidget {

  final NewFriend newFriend;

  NewFriendItem({Key key, this.newFriend})
    : assert(newFriend != null),
    super(key: key);

  @override 
  _NewFriendItemState createState() => _NewFriendItemState();
}

class _NewFriendItemState extends State<NewFriendItem> {

  @override
  Widget build(BuildContext context) {

    // 会话头像初始化
    Widget avatar;
    if (widget.newFriend.isAvatarFromNet()) {
      // 来自网络
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
        child: Image.network(
          widget.newFriend.avatar,
          width: AppConstants.ConversationAvatarSize,
          height: AppConstants.ConversationAvatarSize,
        ),
      );
    } else {
      // 来自本地
      avatar = ClipRRect(
        borderRadius: BorderRadius.circular(AppConstants.AvatarRadius),
        child: Image.asset(
          widget.newFriend.avatar,
          width: AppConstants.ConversationAvatarSize,
          height: AppConstants.ConversationAvatarSize,
        ),
      );
    }

    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // 跳转到朋友信息页面
          print('打开，${widget.newFriend.title}');
        },
        child: Container(
          padding: EdgeInsets.only(left: 16.0, right: 16.0),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // 头像
                avatar,
                SizedBox(width: 12.0,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(top: 14.0, bottom: 14.0),
                    // 分隔线
                    decoration: BoxDecoration(
                      // 边框
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
                              // 新朋友标题
                              Text(widget.newFriend.title, style: AppStyles.TitleStyle),
                              SizedBox(height: 2.0,),
                              // 新朋友简介
                              Text(widget.newFriend.desc, style: AppStyles.DescStyle, maxLines: 1,)
                            ],
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        // 添加好友按钮
                        Container(
                          child: widget.newFriend.isAdd ? 
                            OutlineButton(
                              textColor: Color(AppColors.AddContactBorderColor),
                              child: new Text('添加'),
                              onPressed: () {
                                print('添加好友');
                              },
                            ) :
                            Container(
                              padding: EdgeInsets.only(right: 24.0),
                              child: Text('已添加', style: AppStyles.NewFriendAddedTextStyle,),
                            ),
                        ),
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