import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';

// 下拉菜单选项
enum ActionItems {
  GROUP_CHAT, 
  ADD_FRIEND, 
  QR_SCAN, 
  PAYMENT, 
  HELP
}

// 顶部下拉菜单项
class _HomePopupMenuItem extends StatelessWidget {

  // 下拉菜单图标
  final int iconName;
  // 下拉菜单名称
  final String title;

  _HomePopupMenuItem(
    this.iconName, 
    this.title
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        
        // 下拉列表图标
        Icon(IconData(
          this.iconName,
          fontFamily: AppConstants.IconFontFamily
        ), size: 22.0, color: const Color(AppColors.AppBarPopupMenuColor)),
        
        SizedBox(width: 12.0,),
        
        // 下拉列表文字
        Text(this.title, style: TextStyle(color: const Color(AppColors.AppBarPopupMenuColor)))
      ],
    );
  }
}

// 顶部下拉菜单
class HomePopupMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

      // 构建下拉菜单选项
      itemBuilder: (BuildContext context) {
        return <PopupMenuItem<ActionItems>>[
          PopupMenuItem(
            child: _HomePopupMenuItem(0xe69e, '发起群聊'),
            value: ActionItems.GROUP_CHAT,
          ),
          PopupMenuItem(
            child: _HomePopupMenuItem(0xe638, '添加好友'),
            value: ActionItems.ADD_FRIEND,
          ),
          PopupMenuItem(
            child: _HomePopupMenuItem(0xe61b, '扫一扫'),
            value: ActionItems.QR_SCAN,
          ),
          PopupMenuItem(
            child: _HomePopupMenuItem(0xe62a, '收付款'),
            value: ActionItems.PAYMENT,
          ),
          PopupMenuItem(
            child: _HomePopupMenuItem(0xe63d, '帮助与反馈'),
            value: ActionItems.HELP,
          ),
        ];
      },

      // 下拉菜单显示图标
      icon: Icon(
        IconData(
          0xe60e,
          fontFamily: AppConstants.IconFontFamily
        ), 
        size: AppConstants.ActionIconSize, 
        color: Color(AppColors.ActionIconColor),
      ),

      // 下拉菜单列表点击事件
      onSelected: (ActionItems selected) {
        print('点击的是$selected');
      },
    );
  }
}