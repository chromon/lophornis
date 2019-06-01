import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:lophornis/constants.dart';
import '../modal/me.dart' show me;
import '../constants.dart' show AppColor, AppStyles;
import 'package:lophornis/widget/function_item_widget.dart';

class _Header extends StatelessWidget {

  static const AVATAR_SIZE = 64.0;
  static const SEPARATOR_SIZE = 16.0;
  static const QR_CODE_PREVIEW_SIZE = 20.0;

  @override 
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      color: AppColor.HeaderCardBg,
      padding: const EdgeInsets.only(
        left: 32.0,
        right: Constants.HORIZONTAL_PADDING,
        top: 0.0,
        bottom: 42.0
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(
              me.avatar,
              width: AVATAR_SIZE,
              height: AVATAR_SIZE,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(
                    left: SEPARATOR_SIZE,
                    bottom: 5.0,
                  ),
                  child: Text(me.name, style: AppStyles.HeaderCardTitleTextStyle,),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: SEPARATOR_SIZE),
                        child: Text('微信号：' + me.account, style: AppStyles.HeaderCardDescTextStyle,),
                      ),
                    ),
                    Image.asset(
                      'assets/images/ic_qrcode_preview_tiny.png',
                      width: QR_CODE_PREVIEW_SIZE,
                      height: QR_CODE_PREVIEW_SIZE,
                    ),
                    FunctionItemWidget.arrowRight(),
                  ],
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}

class FunctionsPage extends StatefulWidget {
  @override
  _FunctionsPageState createState() => _FunctionsPageState();
}

class _FunctionsPageState extends State<FunctionsPage> {

  static const SEPARATOR_SIZE = 10.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(AppColor.BackgroundColor),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _Header(),
            SizedBox(height: SEPARATOR_SIZE,),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_wallet.png',
              title: '支付',
              onPressed: () {
                print('点击的是钱包按钮。');
              },
            ),
            SizedBox(height: SEPARATOR_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_collections.png',
              title: '收藏',
              showDivider: true,
              onPressed: () {
                print('点击的是收藏按钮。');
              },
            ),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_album.png',
              title: '相册',
              showDivider: true,
              onPressed: () {
                print('点击的是相册按钮。');
              },
            ),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_emotions.png',
              title: '表情',
              onPressed: () {
                print('打开表情应用');
              },
            ),
            SizedBox(height: SEPARATOR_SIZE),
            FunctionItemWidget(
              iconPath: 'assets/images/ic_settings.png',
              title: '设置',
              desc: '账号未保护',
              onPressed: () {
                print('打开设置');
              },
            ),
          ],
        ),
      ),
    );
  }
}