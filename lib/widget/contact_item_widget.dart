import 'package:flutter/material.dart';

import 'package:lophornis/constants.dart';

// 联系人项
class ContactItem extends StatelessWidget {

  // 联系人头像
  final String avatar;
  // 联系人姓名
  final String title;
  // 索引项标题
  final String indexItemTitle;
  // 一个空的回调方法，用来接收列表项的点击事件
  final VoidCallback onPressed;

  // 列表项垂直边距
  static const double MARGIN_VERTICAL = 10.0;
  // 列表项水平边距
  static const double MARGIN_HORIZENTAL = 16.0;

  // 分组索引项高度
  static const double INDEX_ITEM_HEIGHT = 34.0;

  ContactItem({
    @required this.avatar,
    @required this.title,
    this.indexItemTitle,
    this.onPressed
  });

  // 判断头像是否是从网络获取
  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  // 计算列表项高度
  static double itemHeight(bool _hasIndexItemTitle) {
    // 列表项的高度 = 上下边距 + 图片高度
    final _height = MARGIN_VERTICAL * 2 + Constants.ContactAvatarSize + Constants.DividerWidth;
    // 如果存在索引项，则高度 = 列表项的高度 + 索引项高度
    if (_hasIndexItemTitle) {
      return _height + INDEX_ITEM_HEIGHT;
    }
    return _height;
  }

  @override
  Widget build(BuildContext context) {

    // 头像控件，判断来源
    Widget _avatarIcon;
    if (_isAvatarFromNet) {
      _avatarIcon = ClipRRect(
        borderRadius: BorderRadius.circular(Constants.AvatarRadius),
        child: Image.network(
          avatar,
          width: Constants.ContactAvatarSize,
          height: Constants.ContactAvatarSize,
        ),
      );
    } else {
       _avatarIcon = ClipRRect(
        borderRadius: BorderRadius.circular(Constants.AvatarRadius),
        child: Image.asset(
          avatar,
          width: Constants.ContactAvatarSize,
          height: Constants.ContactAvatarSize,
        ),
      );
    }

    // 联系人列表项主体部分（不包括索引项）
    Widget _item = InkWell(
      onTap: () {
         print('联系人：$title');
      },
      child: Container(
        margin: const EdgeInsets.only(left: MARGIN_HORIZENTAL),
        child: Row(
          children: <Widget>[
            // 联系人头像
            _avatarIcon,
            SizedBox(width: 16.0,),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(right: MARGIN_HORIZENTAL),
                height: ContactItem.itemHeight(false),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: Constants.DividerWidth, color: const Color(AppColor.DividerColor))
                  ),
                ),
                // 联系人名字
                child: Text(title, style: AppStyles.TitleStyle, maxLines: 1,),
              ),
            ),
          ],
        ),
      ),
    );
    
    // 索引项（分组标签） + 列表项主体
    Widget _itemBody;
    if (this.indexItemTitle != null) {
      // 索引项标题存在时才会添加
      _itemBody = Column(
        children: <Widget>[
          // 分组标签
          Container(
            height: INDEX_ITEM_HEIGHT,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            color: Color(AppColor.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.indexItemTitle, style: AppStyles.GroupTitleItemTextStyle,)
          ),
          // 联系人列表项
          _item,
        ],
      );
    } else {
      _itemBody = _item;
    }

    return  _itemBody;
  }
}