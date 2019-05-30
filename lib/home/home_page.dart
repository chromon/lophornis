import 'package:flutter/material.dart';
import 'package:lophornis/constants.dart';
import 'package:lophornis/home/contacts_page.dart';
import 'package:lophornis/home/conversation_page.dart';
import 'package:lophornis/home/discover_page.dart';
import 'package:lophornis/home/functions_page.dart';
import 'package:lophornis/widget/HomePopupMenu.dart';
import 'package:lophornis/widget/HomeNavigationItem.dart';

import 'package:flutter/services.dart';

import '../constants.dart' show Constants, AppColor, AppStyles;

class HomePage extends StatefulWidget {

  // 顶部 Action bar 标题
  String title = '微信';
  // 顶部 Action bar 颜色
  Color headerColor;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Action bar 默认颜色
  static const HeaderColor = const Color(AppColor.PrimaryColor);

  // 前三个界面的状态栏（会话页、联系人页、发现页）
  List<Widget> _mainActions;
  // “我” 界面的状态栏
  List<Widget> _functionActions;

  // 用于管理滚动视图的状态
  PageController _pageController;
  // 页面的集合
  List<Widget> _pages;

  // 底部导航栏索引值
  int _currentIndex = 0;
  // 底部导航栏数据信息
  List<HomeNavigationItem> _navigationViews;

  void initState() {
    super.initState();

    // Action bar 默认颜色
    widget.headerColor = HeaderColor;

    // 初始化前三个界面的 Action bar 操作按钮
    _mainActions = [
      // 搜索按钮
      IconButton(
        icon: Icon(
          IconData(
            0xe65e,
            fontFamily: Constants.IconFontFamily,
          ),
          size: Constants.ActionIconSize,
          color: const Color(AppColor.ActionIconColor),
        ),
        onPressed: () { print('点击了搜索按钮'); },
      ),
      SizedBox(width: 16.0,),

      // 下拉菜单
      Theme(
        data: ThemeData(
          cardColor: Color(AppColor.ActionMenuBgColor),
        ),
        child: HomePopupMenu(),
      ),
      SizedBox(width: 16.0,),
    ];

    // “我”界面 Action bar 短视频相机按钮
    _functionActions = [
      IconButton(
        icon: Icon(
          IconData(
            0xe60a,
            fontFamily: Constants.IconFontFamily,
          ),
          size: Constants.ActionIconSize + 4.0,
          color: const Color(AppColor.ActionIconColor),
        ),
        onPressed: () { print('打开相机拍短视频');},
      ),
    ];

    // 初始化 pageController
    _pageController = PageController(initialPage: _currentIndex);
    // 初始化导航页面内容
    _pages = [
        // 会话页
        ConversationPage(),
        // 联系人页
        ContactsPage(),
        // 发现页
        DiscoverPage(),
        // “我”页面
        FunctionsPage()
    ];

    // 初始化底部导航栏
    _navigationViews = HomeNavigation().navigations();
  }

  @override
  Widget build(BuildContext context) {

    // 设置顶部状态栏透明
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));

    // 构建底部导航栏
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      fixedColor: const Color(AppColor.TabIconActive),
      // 遍历 _navigationViews 通过 map 遍历取出每一个 HomeNavigationItem 里的 item 对象，合并成数组返回
      items: _navigationViews.map((HomeNavigationItem navigationItem) {
        return navigationItem.item;
      }).toList(),
      // 当前选中的索引
      currentIndex: _currentIndex,
      // 动画效果——宽度固定不变
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        // 重绘控件
        setState(() {
          // 修改 tab 索引值
          _currentIndex = index;
          // 点击 tab 时页面重绘
          _pageController.jumpToPage(_currentIndex);
        });
        print('点击的是第 $index 个Tab');
      },
    );

    return Scaffold(
      appBar: new AppBar(
        // 标题栏名称
        title: new Text(widget.title, style: AppStyles.TitleStyle,),
        // 去掉 appbar 下面的阴影
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: widget.headerColor,

        // 标题栏按钮
        actions: _currentIndex == 3 ? _functionActions : _mainActions,
      ),

      // 中心内容
      body: PageView.builder(
        // 生成相应页面
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        controller: _pageController,
        // 总页数
        itemCount: _pages.length,
        // 页面触发回调函数
        onPageChanged: (int index) {
          setState(() {
            // 左右滑动时与底部 tab 联动
            _currentIndex = index;
            // 修改顶部标题
            switch (index) {
              case 0:
                widget.title = '微信';
                widget.headerColor = HeaderColor;
                break;
              case 1:
                widget.title = '通讯录';
                widget.headerColor = HeaderColor;
                break;
              case 2:
                widget.title = '发现';
                widget.headerColor = HeaderColor;
                break;
              case 3:
                widget.title = '我';
                widget.headerColor = Colors.white;
                break;
            }
          });
        },
      ),

      // 页面底部导航栏
      bottomNavigationBar: botNavBar,
    );
  }
}