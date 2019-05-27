import 'package:flutter/material.dart';
import 'package:lophornis/constants.dart';
import 'package:lophornis/home/contacts_page.dart';
import 'package:lophornis/home/conversation_page.dart';
import 'package:lophornis/home/discover_page.dart';
import 'package:lophornis/home/functions_page.dart';

import '../constants.dart' show Constants;

// 下拉菜单选项
enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

// 底部导航栏 View
class NavigationIconView {
  // 导航栏标题
  final String _title;
  // 默认图标
  final IconData _icon;
  // 激活状态图标
  final IconData _activeIcon;

  final BottomNavigationBarItem item;

  // 构造方法初始化
  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}):
    _title = title,
    _icon = icon,
    _activeIcon = activeIcon,

    item = BottomNavigationBarItem(
      icon: Icon(icon, color: Color(AppColor.TabIconNormal)),
      activeIcon: Icon(activeIcon, color: Color(AppColor.TabIconActive)),
      title: new Text(title, style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColor.TabIconNormal)
      )),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 用于管理滚动视图的状态
  PageController _pageController;
  // 页面的集合
  List<Widget> _pages;

  // 底部导航栏索引值
  int _currentIndex = 0;

  // 底部导航栏数据信息
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();

    // 初始化 pageController
    _pageController = PageController(initialPage: _currentIndex);
    // 初始化页面内容
    _pages = [
        ConversationPage(),
        ContactsPage(),
        DiscoverPage(),
        FunctionsPage()
    ];

    // 初始化底部导航栏
    _navigationViews = [
      // 微信首页 tab
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily,
        ),
      ),

      // 通讯录 tab
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe601,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
      ),

      // 发现页面 tab
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe600,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        ),
      ),

      // 个人页面 tab
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe626,
          fontFamily: Constants.IconFontFamily,
        ),
      )
    ];
  }

  // 顶部 appbar 下拉菜单自定义带图标控件
  _bulidPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        // 下拉列表图标
        Icon(IconData(
          iconName,
          fontFamily: Constants.IconFontFamily
        ), size: 22.0, color: const Color(AppColor.AppBarPopupMenuColor)),
        
        Container(width: 12.0,),

        // 下拉列表文字
        Text(title, style: TextStyle(color: const Color(AppColor.AppBarPopupMenuColor)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    // 构建底部导航栏
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      // 遍历 _navigationViews 通过 map 遍历取出每一个 view 里的 item 对象，合并成数组返回
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
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
          _pageController.animateToPage(
            _currentIndex, 
            duration: Duration(milliseconds: 50), 
            curve: Curves.ease);
        });
        print('点击的是第 $index 个Tab');
      },
    );

    return Scaffold(
      appBar: new AppBar(
        // 标题栏名称
        title: new Text('微信'),
        // 去掉 appbar 下面的阴影
        elevation: 0.0,

        // 标题栏按钮
        actions: <Widget>[
          // 搜索按钮
          IconButton(
            icon: Icon(IconData(
              0xe65e,
              fontFamily: Constants.IconFontFamily
            ), size: 22.0,),
            onPressed: () { print('点击了搜索按钮'); },
          ),

          // 设置组件间空白宽度
          Container(width: 16.0),

          // 下拉菜单
          Theme(
            data: ThemeData(
              cardColor: Color(AppColor.AppBarColor),
            ),
            child: PopupMenuButton(
              // 构建下拉菜单选项
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<ActionItems>>[
                  PopupMenuItem(
                    child: _bulidPopupMenuItem(0xe69e, '发起群聊'),
                    value: ActionItems.GROUP_CHAT,
                  ),
                  PopupMenuItem(
                    child: _bulidPopupMenuItem(0xe638, '添加好友'),
                    value: ActionItems.ADD_FRIEND,
                  ),
                  PopupMenuItem(
                    child: _bulidPopupMenuItem(0xe61b, '扫一扫'),
                    value: ActionItems.QR_SCAN,
                  ),
                  PopupMenuItem(
                    child: _bulidPopupMenuItem(0xe62a, '收付款'),
                    value: ActionItems.PAYMENT,
                  ),
                  PopupMenuItem(
                    child: _bulidPopupMenuItem(0xe63d, '帮助与反馈'),
                    value: ActionItems.HELP,
                  ),
                ];
              },

              // 下拉菜单显示图标
              icon: Icon(IconData(
                0xe60e,
                fontFamily: Constants.IconFontFamily
              ), size: 22.0, color: AppColor.ActionIconColor,),

              // 下拉菜单列表点击事件
              onSelected: (ActionItems selected) {
                print('点击的是$selected');
              },
            ),
          ),
          // 设置组件间空白宽度
          Container(width: 10.0),
        ],
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
          });
        },
      ),

      // 页面底部导航栏
      bottomNavigationBar: botNavBar,
    );
  }
}