import 'package:flutter/material.dart';
import 'dart:ui' as ui show window;

import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/modal/moment.dart';

class MomentItemWidget extends StatelessWidget {

  final Moment moment;

  MomentItemWidget({this.moment});

  @override
  Widget build(BuildContext context) {

    // 图片数量
    int imageSize = moment.images.length;

    double divisor = 0;
    if (imageSize == 1) {
      divisor = 1.5;
    } else if (imageSize == 2 || imageSize == 4) {
      divisor = 2.0;
    } else if (imageSize == 3 || imageSize > 4) {
      divisor = 3.0;
    }

    // 每个图片宽度，去掉头像图片/左右边距/中间空白
    double imageWidth = (MediaQueryData.fromWindow(ui.window).size.width - 20 - 50 - 10) / divisor;
    // 视频宽度
    double videoWidth = (MediaQueryData.fromWindow(ui.window).size.width - 20 - 50 - 10) / 2.2;

    print(moment.images);
    print(moment.video);

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
              '${moment.avatar}',
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
                  Text('${moment.nickname}', style: TextStyle(color: Color(0xff576b95), fontSize: 16.0, fontWeight: FontWeight.bold),),
                  
                  // 文字部分
                  Offstage(
                    offstage: moment.content.isEmpty,
                    child: Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text('${moment.content}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                      )
                    ),
                  ),
                  
                  // 图片
                  Offstage(
                    offstage: imageSize == 0,
                    child: imageSize > 1 
                      ? GridView.builder(
                          padding: EdgeInsets.only(top: 8.0),
                          itemCount: imageSize,
                          shrinkWrap: true,
                          primary: false,
                          gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: imageWidth,
                            crossAxisSpacing: 2.0,
                            mainAxisSpacing: 2.0,
                            childAspectRatio: 1
                          ),
                          itemBuilder: (BuildContext  context, int index) {
                            Image.asset(
                              '${moment.images.isNotEmpty ? moment.images[index] : ''}',
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Container(
                          padding: EdgeInsets.only(top: 8.0),
                          child: Image.asset(
                            '${moment.images.length == 1 ? moment.images[0] : ''}',
                            width: imageWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                  ),

                  // 视频
                  Offstage(
                    offstage: moment.video == null,
                    child: Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Image.asset(
                            '${moment.video?.videoImage}',
                            width: videoWidth,
                            fit: BoxFit.cover,
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {}
                          )
                        ],
                      ),
                      width: videoWidth
                    ),
                  ),

                  // 定位地址
                  Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('${moment.address}', style: TextStyle(color: Colors.grey[500], fontSize: 13),),
                  ),
                  // 发布时间
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('${moment.time}', style: TextStyle(color: Colors.grey[500], fontSize: 13),),
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