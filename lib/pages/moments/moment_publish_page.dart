import 'package:flutter/material.dart';

import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_styles.dart';

class MomentPublishPage extends StatefulWidget {
  @override
  _MomentPublishPageState createState() => _MomentPublishPageState();
}

class _MomentPublishPageState extends State<MomentPublishPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(AppColors.BackgroundColor),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            IconData(
              0xe64c,
              fontFamily: AppConstants.IconFontFamily,
            ),
            size: AppConstants.ActionIconSize + 4.0,
            color: const Color(AppColors.ActionIconColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.0,
        brightness: Brightness.light,
        backgroundColor: const Color(AppColors.PrimaryColor),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: RaisedButton(
              color: Color(AppColors.MainColor),
              child: Text('发表', style: TextStyle(fontSize: 16.0, color: Colors.white),),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 16.0,),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                maxLines: 4,
                cursorColor: Color(AppColors.MainColor),
                decoration: InputDecoration(
                  hintText: '这一刻的想法...',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 100.0,),
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffD9D9D9),
                    width: AppConstants.DividerWidth
                  ),
                  bottom: BorderSide(
                    color: Color(0xffD9D9D9),
                    width: AppConstants.DividerWidth
                  ),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          IconData(
                            0xe61e,
                            fontFamily: AppConstants.IconFontFamilyExtra,
                          ),
                          size: AppConstants.ActionIconSize,
                          color: const Color(AppColors.ActionIconColor),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Text('所在位置', style: AppStyles.TitleStyle,),
                        ),
                        Icon(
                          IconData(
                            0xe604,
                            fontFamily: AppConstants.IconFontFamily,
                          ),
                          size: 16.0,
                          color: const Color(AppColors.ButtonDescText)
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          IconData(
                            0xe601,
                            fontFamily: AppConstants.IconFontFamilyExtra,
                          ),
                          size: AppConstants.ActionIconSize,
                          color: const Color(AppColors.ActionIconColor),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Text('谁可以看', style: AppStyles.TitleStyle,),
                        ),
                        Text('公开', style: AppStyles.DescStyle,),
                        Icon(
                          IconData(
                            0xe604,
                            fontFamily: AppConstants.IconFontFamily,
                          ),
                          size: 16.0,
                          color: const Color(AppColors.ButtonDescText)
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          IconData(
                            0xe607,
                            fontFamily: AppConstants.IconFontFamilyExtra,
                          ),
                          size: AppConstants.ActionIconSize,
                          color: const Color(AppColors.ActionIconColor),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: Text('提醒谁看', style: AppStyles.TitleStyle,),
                        ),
                        Icon(
                          IconData(
                            0xe604,
                            fontFamily: AppConstants.IconFontFamily,
                          ),
                          size: 16.0,
                          color: const Color(AppColors.ButtonDescText)
                        ),
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0),
              alignment: Alignment.centerLeft,
              child: Icon(
                IconData(
                  0xe621,
                  fontFamily: AppConstants.IconFontFamilyExtra,
                ),
                size: 18.0,
                color: const Color(AppColors.ButtonDescText)
              ),
            ),
          ],
        ),
      ),
    );
  }
}