import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_styles.dart';
import 'package:lophornis/modal/contacts.dart' show Contact, ContactsPageData;
import 'package:lophornis/widget/contact_item_widget.dart';

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
  // 检索盒子显示的字符
  String _currentLetter = '';

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

  // 上部功能列表（固定）
  final List<ContactItem> _functionItems = [
    ContactItem(
      avatar: 'assets/images/ic_new_friend.png',
      title: '新的朋友',
      // onPressed: () { 
      //   print('新的朋友'); 
      //   // Navigator.pushNamed(super.context, Routes.NewFriends);
      // },
    ),
    ContactItem(
      avatar: 'assets/images/ic_group_chat.png',
      title: '群聊',
      // onPressed: () { print('群聊'); },
    ),
    ContactItem(
      avatar: 'assets/images/ic_tag.png',
      title: '标签',
      // onPressed: () { print('标签'); },
    ),
    ContactItem(
      avatar: 'assets/images/ic_public_account.png',
      title: '公众号',
      // onPressed: () { print('公众号'); },
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
    var _totalPos = _functionItems.length * ContactItem.itemHeight(false);
    for (int i = 0; i < _contacts.length; i++) {
      bool _hasIndexItemTitle = true;
      // 前后两联系人列表项索引值相同则没有索引项
      if (i > 0 && _contacts[i].nameIndex.compareTo(_contacts[i - 1].nameIndex) == 0) {
        _hasIndexItemTitle = false;
      }
      
      if (_hasIndexItemTitle) {
        _letterPosMap[_contacts[i].nameIndex] = _totalPos;
      }
      // 添加带索引项的列表高度
      _totalPos += ContactItem.itemHeight(_hasIndexItemTitle);
    }
  }

  // 销毁
  @override
  void dispose() {
    // 销毁滚动控制器
    _scrollController.dispose();
    super.dispose();
  }

  // 获得索引字符
  String _getLetter(BuildContext context, double tileHeight, Offset globalPos) {
    // 将要渲染的控件
    RenderBox _box = context.findRenderObject();
    // 将点击位置由整个屏幕的全局坐标转换为 index bar 控件中的坐标
    var local = _box.globalToLocal(globalPos);
    // 将在indexbar中的坐标与每一个字符控件相除取整，得出的就是字符坐标
    // clamp 表示默认范围
    int index = (local.dy ~/ tileHeight).clamp(0, INDEX_BAR_WORDS.length - 1);
    return INDEX_BAR_WORDS[index];
  }

  // 跳转到当前索引号所在的索引列表项中去
  void _jumpToIndex(String letter) {
    if (_letterPosMap.isNotEmpty) {
      final _pos = _letterPosMap[letter];
      if (_pos != null) {
        // 列表从当前位置滚动到给定位置
        _scrollController.animateTo(_pos, 
          curve: Curves.easeOut, duration: Duration(milliseconds: 200));
      }
    }
  }

  // 创建 index bar
  Widget _buildIndexBar(BuildContext context, BoxConstraints constraints) {

    // 遍历索引字符创建字符控件
    final List<Widget> _letters = INDEX_BAR_WORDS.map((String word) {
      return Expanded(
        child: Text(word),
      );
    }).toList();

    // index bar 最大的高度
    final double _totalHeight = constraints.biggest.height;
    // 每个索引字母的高度
    final double _tileHeight = _totalHeight / _letters.length;
    
    // 手势检测
    return GestureDetector(
      // 纵向的向下拖拽（点）
      onVerticalDragDown: (DragDownDetails details) {
        setState(() {
          widget._indexBarBg = Colors.black12; 
          // 找到索引栏当前字符位置，同时联系人列表跳转到对应位置
          widget._currentLetter = _getLetter(context, _tileHeight, details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      //向下拖拽结束（松开）
      onVerticalDragEnd: (DragEndDetails details) {
        setState(() {
          widget._indexBarBg = Colors.transparent;
          // 拖拽结束时将索引字母盒子关闭
          widget._currentLetter = null;
        });
      },
      // 取消拖拽（直接松开不滑动）
      onVerticalDragCancel: () {
        setState(() {
          widget._indexBarBg = Colors.transparent;
          // 拖拽结束时将索引字母盒子关闭
          widget._currentLetter = null;
        });
      },
      onVerticalDragUpdate: (DragUpdateDetails details) {
        setState(() {
          widget._indexBarBg = Colors.black12; 
          widget._currentLetter = _getLetter(context, _tileHeight, details.globalPosition);
          _jumpToIndex(widget._currentLetter);
        });
      },
      child: Column(
        children: _letters,
      )
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _body = [
      // stack 第一项联系人列表
      ListView.builder(
        // 控制列表滚动
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          // 索引值小于功能列表长度时返回的是功能列表
          if (index < _functionItems.length) {
            return _functionItems[index];
          }

          // 联系人列表的索引值应该是 当前索引 - 上部功能按钮的数量
          int _contactIndex = index - _functionItems.length;
          // 是否显示分组标签，默认第一条显示
          bool _hasIndexItemTitle = true;
          // 当前联系人信息
          Contact _contact = _contacts[_contactIndex];
          // 联系人人信息索引和上一条相同
          if (_contactIndex >= 1 && _contact.nameIndex == _contacts[_contactIndex - 1].nameIndex) {
            _hasIndexItemTitle = false;
          }
          final ContactItem _contactItem = ContactItem(
            avatar: _contact.avatar, 
            title: _contact.name, 
            indexItemTitle: _hasIndexItemTitle ? _contact.nameIndex : null,
          );
          
          return _contactItem;
        },
        // 列表长度为联系人数量 + 上部功能列表的数量
        itemCount: _contacts.length + _functionItems.length,
      ),
      // stack 第二项检索控件
      Positioned(
        width: AppConstants.IndexBarWidth,
        right: 0.0,
        top: 0.0,
        bottom: 0.0,
        child: Container(
          // 控件背景颜色
          color: widget._indexBarBg,
          child: LayoutBuilder(
            builder: _buildIndexBar,
          ),
        ),
      ),
    ];

    if (widget._currentLetter != null && widget._currentLetter.isNotEmpty) {
      _body.add(
        // stack 第三项检索盒子
        Center(
          child: Container(
            width: AppConstants.IndexLetterBoxSize,
            height: AppConstants.IndexLetterBoxSize,
            decoration: BoxDecoration(
              color: AppColors.IndexLetterBoxBg,
              borderRadius: BorderRadius.all(Radius.circular(AppConstants.IndexLetterBoxRadius))
            ),
            child: Center(
              child: Text(widget._currentLetter, style: AppStyles.IndexLetterBoxTextStyle),
            ),
          ),
        ),
      );
    }

    // 联系人列表和检索控件是重叠关系，需要用 Stack
    return Stack(
      children: _body,
    );
  }
}