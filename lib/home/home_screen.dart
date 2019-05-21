import 'package:flutter/material.dart';

import '../constants.dart' show Constants;

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
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: new Text(title),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // 导航栏数据信息
  List<NavigationIconView> _navigationViews;

  void initState() {
    super.initState();
    _navigationViews = [
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

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      // 遍历 _navigationViews 通过 map 遍历取出每一个 view 里的 item 对象，合并成数组返回
      items: _navigationViews.map((NavigationIconView view) {
        return view.item;
      }).toList(),
      // 当前选中的索引
      currentIndex: 0,
      // 动画效果——宽度固定不变
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        print('点击的是第 $index 个Tab');
      },
    );

    return Scaffold(
      appBar: new AppBar(
        // 标题栏名称
        title: new Text('微信'),
        // 标题栏按钮
        actions: <Widget>[
          // 搜索按钮
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () { print('点击了搜索按钮'); },
          ),
          // 添加下拉按钮
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () { print('点击了下拉列表'); },
          )
        ],
      ),
      body: new Container(
        color: Colors.yellow
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}