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

  // 列表项垂直边距
  static const double MARGIN_VERTICAL = 10.0;
  // 分组索引高度
  static const double GROUP_TITLE_HEIGHT = 24.0;


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

  // 计算列表项高度
  static double _height(bool _hasGroupTitle) {
    // 列表项的高度 = 上下边距 + 图片高度
    final _buttonHeight = MARGIN_VERTICAL * 2 + Constants.ContactAvatarSize + Constants.DividerWidth;
    if (_hasGroupTitle) {
      return _buttonHeight + GROUP_TITLE_HEIGHT;
    }
    return _buttonHeight;
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
      // 对称
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      // 边距
      padding: const EdgeInsets.symmetric(vertical: MARGIN_VERTICAL),
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
            height: GROUP_TITLE_HEIGHT,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
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

// 索引字符
const INDEX_BAR_WORDS = [
  "↑", "☆",
  "A", "B", "C", "D", "E", "F", "G",
  "H", "I", "J", "K", "L", "M", "N",
  "O", "P", "Q", "R", "S", "T",
  "U", "V", "W", "X", "Y", "Z",
  "#"
];

class ContactsPage extends StatefulWidget {

  // 检索控件默认背景透明
  Color _indexBarBg = Colors.transparent;

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {

  // 数据列表
  final ContactsPageData data = ContactsPageData.mock();
  final List<Contact> _contacts = [];

  // listview 提供的用于控制列表滚动
  ScrollController _scrollController;

  // 存储索引项与索引项高度位置对应关系
  final Map _letterPosMap = {INDEX_BAR_WORDS[0] : 0.0};

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

  // 初始化
  @override
  void initState() {
    super.initState();
    // 使用 .. 操作符可以实现链式编程
    _contacts..addAll(data.contacts)..addAll(data.contacts);
    // 按索引字母排序
    _contacts.sort((Contact a, Contact b) => a.nameIndex.compareTo(b.nameIndex));
    // 初始化列表滚动控制
    _scrollController = new ScrollController();
    
    // 计算用于 Indexbar进行定位的关键通讯录列表项的位置
    var _totalPos = _functionButtons.length * _ContactItem._height(false);
    for (int i = 0; i < _contacts.length; i++) {
      bool _hasGroupTitle = true;
      // 前后两联系人列表项索引值相同则没有索引项
      if (i > 0 && _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0) {
        _hasGroupTitle = false;
      }
      if (_hasGroupTitle) {
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      // 添加带索引项的列表高度
      _totalPos += _ContactItem._height(_hasGroupTitle);
    }
  }

  // 销毁
  @override
  void dispose() {
    // 销毁滚动控制器
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // 遍历索引字符创建字符控件
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();

    // 联系人列表和检索控件是重叠关系，需要用 Stack
    return Stack(
      children: <Widget>[
        // stack 第一项联系人列表
        ListView.builder(
          // 控制列表滚动
          controller: _scrollController,
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
            final _ContactItem _contactItem = _ContactItem(
              avatar: _contact.avatar, 
              title: _contact.name, 
              groupTitle: _isGroupTitle ? _contact.nameIndex : null,
            );
            
            return _contactItem;
          },
          // 列表长度为联系人数量 + 上部功能列表的数量
          itemCount: _contacts.length + _functionButtons.length,
        ),
        // stack 第二项检索控件
        Positioned(
          width: Constants.IndexBarWidth,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: Container(
            // 控件背景颜色
            color: widget._indexBarBg,
            // 手势检测
            child: GestureDetector(
              // 纵向的向下拖拽（点）
              onVerticalDragDown: (DragDownDetails details) {
                setState(() {
                  widget._indexBarBg = Colors.black12; 
                });
                // 列表从当前位置滚动到给定位置
                _scrollController.animateTo(_letterPosMap['M'], 
                  curve: Curves.easeIn, duration: Duration(milliseconds: 200));
              },
              //向下拖拽结束（松开）
              onVerticalDragEnd: (DragEndDetails details) {
                setState(() {
                  widget._indexBarBg = Colors.transparent;
                });
              },
              // 取消拖拽（直接松开不滑动）
              onVerticalDragCancel: () {
                setState(() {
                  widget._indexBarBg = Colors.transparent;
                });
              },
              child: Column(
                children: _letters,
              )
            ),
          ),
        )
      ],
    );
  }
}