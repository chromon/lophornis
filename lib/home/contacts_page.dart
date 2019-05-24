import 'package:flutter/material.dart';
import '../constants.dart' show AppColor, Constants, AppStyles;
import '../modal/contacts.dart' show Contact, ContactsPageData;

// 联系人项
class _ContactItem extends StatelessWidget {

  // 头像
  final String avatar;
  // 标题
  final String title;
  // 索引标题
  final String groupTitle;
  // 一个空的回调方法，用来接收列表项的点击事件
  final VoidCallback onPressed;

  _ContactItem({
    @required this.avatar,
    @required this.title,
    this.groupTitle,
    this.onPressed
  });

  // 判断头像是否是从网络获取
  bool get _isAvatarFromNet {
    return this.avatar.startsWith('http') || this.avatar.startsWith('https');
  }

  @override
  Widget build(BuildContext context) {

    // 头像控件，判断来源
    Widget _avatarIcon;
    if (_isAvatarFromNet) {
      _avatarIcon = Image.network(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    } else {
      _avatarIcon = Image.asset(
        avatar,
        width: Constants.ContactAvatarSize,
        height: Constants.ContactAvatarSize,
      );
    }

    // 列表项主体部分
    Widget _button = Container(
        // 边距
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: Constants.DividerWidth, color: const Color(AppColor.DividerColor))
          ),
        ),
        child: Row(
          children: <Widget>[
            // 联系人头像
            _avatarIcon,
            SizedBox(width: 10.0,),
            // 联系人名字
            Text(title),
          ],
        ),
      );

    // 分组标签 + 列表项主体
    Widget _itemBody;
    if (this.groupTitle != null) {
      _itemBody = Column(
        children: <Widget>[
          // 分组标签
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 4.0, bottom: 4.0),
            color: Color(AppColor.ContactGroupTitleBg),
            alignment: Alignment.centerLeft,
            child: Text(this.groupTitle, style: AppStyles.GroupTitleItemTextStyle,)
          ),
          // 联系人列表项
          _button,
        ],
      );
    } else {
      _itemBody = _button;
    }

    return  _itemBody;
  }
}

class ContactsPage extends StatefulWidget {
  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  // 数据列表
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];

  // 上部功能列表
  final List<_ContactItem> _functionButtons = [
    _ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      onPressed: () { print('新朋友'); },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      onPressed: () { print('群聊'); },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      onPressed: () { print('标签'); },
    ),
    _ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      onPressed: () { print('公众号'); },
    ),
  ];

  @override
  void initState() {
    super.initState();
    // 使用 .. 操作符可以实现链式编程
    _contacts..addAll(data.contacts)..addAll(data.contacts);
    // 按索引字母排序
    _contacts.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        // 索引值小于功能列表长度时返回的是功能列表
        if (index < _functionButtons.length) {
          return _functionButtons[index];
        }

        // 联系人列表的索引值应该是 当前索引 - 上部功能按钮的数量
        int _contactIndex = index - _functionButtons.length;
        // 是否显示分组标签，默认第一条显示
        bool _isGroupTitle = true;
        // 当前联系人信息
        Contact _contact = _contacts[_contactIndex];
        // 练习人信息索引和上一条相同
        if (_contactIndex >= 1 && _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
          _isGroupTitle = false;
        }
        return _ContactItem(
          avatar: _contact.avatar, 
          title: _contact.name, 
          groupTitle: _isGroupTitle ? _contact.nameIndex : null,
        );
      },
      // 列表长度为联系人数量 + 上部功能列表的数量
      itemCount: _contacts.length + _functionButtons.length,
    );
  }
}