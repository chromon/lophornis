import 'package:flutter/material.dart';
import "package:lophornis/home/full_width_icon_button.dart";
import 'package:lophornis/constants.dart' show AppColor;

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  // 分组之间的间距
  static const SEPARATE_SIZE = 20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColor.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: SEPARATE_SIZE,),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_social_circle.png',
              title: '朋友圈',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_quick_scan.png',
              title: '扫一扫',
              showDivider: true,
              onPressed: () {
                print('点击了扫一扫');
              },
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_shake_phone.png',
              title: '摇一摇',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_feeds.png',
              title: '看一看',
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_quick_search.png',
              title: '搜一搜',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_people_nearby.png',
              title: '附近的人',
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_bottle_msg.png',
              title: '漂流瓶',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_shopping.png',
              title: '购物',
              showDivider: true,
              onPressed: () {},
            ),
            FullWidthIconButton(
              iconPath: 'assets/images/ic_game_entry.png',
              title: '游戏',
              onPressed: () {},
            ),
            SizedBox(height: SEPARATE_SIZE),
            FullWidthIconButton(
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