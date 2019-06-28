import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/widget/function_item_widget.dart';

class MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage> {

  // 头部图片总高度
  final double _appBarHeight = 256.0;
  double navAlpha = 0;
  // appbar 高度
  double navigationBarHeight = MediaQueryData.fromWindow(ui.window).padding.top + kToolbarHeight;
  ScrollController scrollController = ScrollController();

  // 图标颜色
  Color iconColor = Colors.white;
  // appbar 标题
  String appBarTitle = '';
  // appbar 背景颜色
  Color appBarColor = Colors.transparent;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() => navAlpha = 0);
        }
      } else if (offset < _appBarHeight) {
        if (_appBarHeight - offset <= navigationBarHeight) {
          setState(() {
            iconColor = Colors.black;
            appBarTitle = '朋友圈';
            appBarColor = Color(AppColors.PrimaryColor);
          });
        } else {
          iconColor = Colors.white;
          appBarTitle = '';
          appBarColor = Colors.transparent;
        }
        setState(() => navAlpha = 1 - (_appBarHeight - offset) / _appBarHeight);
      } else if (navAlpha != 1) {
        setState(() => navAlpha = 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: <Widget>[
                Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/moments_bg.png',
                        fit: BoxFit.fitWidth,
                        height: _appBarHeight,
                        // 屏幕总宽度
                        width: MediaQueryData.fromWindow(ui.window).size.width,
                      ),
                      margin: EdgeInsets.only(bottom: 35.0)
                    ),
                    Container(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 10, right: 10),
                              child: Text(
                                'Ellery',
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 17
                                )
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: Image.asset(
                                'assets/images/default_nor_avatar.png',
                                width: 70.0,
                                height: 70.0,
                              ),
                            ),
                          ]
                        ),
                      margin: EdgeInsets.only(right: 10)
                    ),
                  ],
                ),
                    
                FunctionItemWidget(
                  iconPath: 'assets/images/ic_wallet.png',
                  title: '支付',
                  onPressed: () {
                    print('点击的是钱包按钮。');
                  },
                ),
                FunctionItemWidget(
                  iconPath: 'assets/images/ic_wallet.png',
                  title: '支付2',
                  onPressed: () {
                    print('点击的是钱包按钮。');
                  },
                ),
                FunctionItemWidget(
                  iconPath: 'assets/images/ic_wallet.png',
                  title: '支付3',
                  onPressed: () {
                    print('点击的是钱包按钮。');
                  },
                ),
                SizedBox(height: 1000.0,),
              ],
            ),
          ),
          Container(
            // appbar 高度
            height: MediaQueryData.fromWindow(ui.window).padding.top + kToolbarHeight,
            child: AppBar(
              title: Text(appBarTitle, style: TextStyle(fontSize: 16.0, color: iconColor),),
              // 返回图标
              leading: IconButton(
                icon: Icon(
                  IconData(
                    0xe64c,
                    fontFamily: AppConstants.IconFontFamily,
                  ),
                  size: AppConstants.ActionIconSize + 4.0,
                  color: iconColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              // iconTheme: IconThemeData(color: c, size: 20),
              elevation: 0.0,
              brightness: Brightness.light,
              backgroundColor: appBarColor,
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    IconData(
                      0xe60a,
                      fontFamily: AppConstants.IconFontFamily,
                    ),
                    size: AppConstants.ActionIconSize + 4.0,
                    color: iconColor,
                  ),
                  onPressed: () { print('打开相机拍短视频');},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}