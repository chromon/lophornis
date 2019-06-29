import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';

class MomentItemWidget extends StatefulWidget {
  @override
  _MomentItemWidgetState createState() => _MomentItemWidgetState();
}

class _MomentItemWidgetState extends State<MomentItemWidget> {

  double imageWidth = (MediaQueryData.fromWindow(ui.window).size.width - 20 - 50 - 10) / 2.2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        // 边框
        border: Border(
          bottom: BorderSide(
            color: Color(AppColors.DividerColor),
            width: AppConstants.DividerWidth
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 头像
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(
              'assets/images/default_nor_avatar.png',
              width: 50.0,
              height: 50.0,
            ),
          ),
          // 主项部分
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10.0, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 昵称
                  Text('测试测试Ellery', style: TextStyle(color: Color(0xff576b95), fontSize: 16.0, fontWeight: FontWeight.bold),),
                  // 文字部分
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('测试文字，函数是用来完成某个任务的代码块。一个函数接收一组输入，根据输入执行一些计算，然后产生一个输出。',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                    )
                  ),
                  // 图片
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      'assets/images/ic_splash_origin.png',
                      width: imageWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // 定位地址
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('beijing', style: TextStyle(color: Colors.grey[500], fontSize: 13),),
                  ),
                  // 发布时间
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('15:23', style: TextStyle(color: Colors.grey[500], fontSize: 13),),
                          Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text('删除', style: TextStyle(color: Colors.blueAccent),),
                          )
                        ]
                      ),
                      IconButton(
                        icon: Icon(
                          IconData(
                            0xe634,
                            fontFamily: AppConstants.IconFontFamilyExtra,
                          ),
                          size: 16.0,
                          color: const Color(AppColors.ButtonDescText)
                        ),
                        onPressed: () {}
                      ),
                    ], 
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}