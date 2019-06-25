import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/widget/function_item_widget.dart';

class MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class _MomentsPageState extends State<MomentsPage> {

  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //没有铺满也可以滑动
        physics: AlwaysScrollableScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: Icon(
                IconData(
                  0xe64c,
                  fontFamily: AppConstants.IconFontFamily,
                ),
                size: AppConstants.ActionIconSize + 4.0,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: _appBarHeight,
            pinned: _appBarBehavior == AppBarBehavior.pinned,
            floating: _appBarBehavior == AppBarBehavior.floating || _appBarBehavior == AppBarBehavior.snapping,
            snap: _appBarBehavior == AppBarBehavior.snapping,
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.create),
                tooltip: 'Edit',
                onPressed: () {},
              ),
              PopupMenuButton<AppBarBehavior>(
                onSelected: (AppBarBehavior value) {
                  setState(() {
                    _appBarBehavior = value;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<AppBarBehavior>>[
                  const PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.normal,
                    child: Text('App bar scrolls away'),
                  ),
                  const PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.pinned,
                    child: Text('App bar stays put'),
                  ),
                  const PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.floating,
                    child: Text('App bar floats'),
                  ),
                  const PopupMenuItem<AppBarBehavior>(
                    value: AppBarBehavior.snapping,
                    child: Text('App bar snaps'),
                  ),
                ],
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Ali Connors'),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'assets/images/moments_bg.png',
                    fit: BoxFit.cover,
                    height: _appBarHeight,
                  ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.4),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
                FunctionItemWidget(
                  iconPath: '',
                  showAvatar: false,
                  title: '账号与安全',
                  onPressed: () {print('点击了账号与安全');},
                ),
              ]
            ),
          ),
        ],
      ),
    );
  }
}