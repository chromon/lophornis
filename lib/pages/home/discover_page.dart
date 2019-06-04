import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_colors.dart';
import "package:lophornis/widget/function_item_widget.dart";

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {

  // 分组之间的间距
  static const SEPARATE_SIZE = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColors.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FunctionItemWidget(
              iconPath: 'assets/images/ic_social_circle.png',
              title: '朋友圈',
              customWidget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FunctionItemWidget.iconTag(
                    'assets/images/default_nor_avatar.png',
                    showDot: true,
                    isBig: true,
                  ),
                  SizedBox(width: 12.0,),
                ],
              ),
              onPressed: () {print('点击了朋友圈');},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_quick_scan.png',
              title: '扫一扫',
              showDivider: true,
              onPressed: () {
                print('点击了扫一扫');
              },
            ),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_shake_phone.png',
              title: '摇一摇',
              onPressed: () {print('点击了摇一摇');},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_feeds.png',
              title: '看一看',
              showDivider: true,
              customWidget: Row(
                children: <Widget>[
                  FunctionItemWidget.tag("NEW"),
                ],
              ),
              onPressed: () {print('点击了看一看');},
            ),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_quick_search.png',
              title: '搜一搜',
              onPressed: () {print('点击了搜一搜');},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_people_nearby.png',
              title: '附近的人',
              showDivider: true,
              onPressed: () {print('点击了附近的人');},
            ),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_bottle_msg.png',
              title: '漂流瓶',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_shopping.png',
              title: '购物',
              showDivider: true,
              onPressed: () {print('点击了购物');},
            ),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_game_entry.png',
              title: '游戏',
              customWidget: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FunctionItemWidget.descText('注册领时装抢红包'),
                  SizedBox(width: 6.0,),
                  FunctionItemWidget.iconTag('assets/images/ad_game_notify.png'),
                  SizedBox(width: 12.0,)
                ],
              ),
              onPressed: () {print('点击了游戏');},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_mini_program.png',
              title: '小程序',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
          ],
        ),
      )
    );
  }
}