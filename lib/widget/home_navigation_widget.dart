import 'package:flutter/material.dart';

import 'package:lophornis/constants.dart';

// 底部导航栏 View
class HomeNavigationItem {

  // 导航栏菜单项
  final BottomNavigationBarItem item;

  // 构造方法初始化
  // title: 导航栏标题
  // icon: 默认图标
  // activeIcon: 激活状态图标
  HomeNavigationItem({Key key, String title, IconData icon, IconData activeIcon}):

    item = BottomNavigationBarItem(
      // 导航栏图标
      icon: Icon(icon, color: Color(AppColor.TabIconNormal)),
      // 导航栏激活状态图标
      activeIcon: Icon(activeIcon, color: Color(AppColor.TabIconActive)),
      // 导航栏标题
      title: new Text(title, style: TextStyle(
        fontSize: 14.0,
        color: Color(AppColor.TabIconNormal)
      )),
      backgroundColor: Colors.white
    );
}

class HomeNavigation {

  List<HomeNavigationItem> _navigationList = [
      // 微信首页 tab
      HomeNavigationItem(
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
      HomeNavigationItem(
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
      HomeNavigationItem(
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
      HomeNavigationItem(
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

  // 底部导航栏数据信息
  List<HomeNavigationItem> navigations() {
    return _navigationList;
  }
}