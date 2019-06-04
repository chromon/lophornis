import 'package:flutter/material.dart';

import 'package:lophornis/modal/chats.dart';
import 'package:lophornis/constants/app_colors.dart';
import 'package:lophornis/constants/app_constants.dart';
import 'package:lophornis/constants/app_styles.dart';

/*
 *  顶部设备登录状态控件
 */
class DeviceInfoItem extends StatelessWidget {

  // 登录设备的类型
  final Device device;

  const DeviceInfoItem({this.device: Device.WIN}) :
    assert(device != null);

  // 判断登录设备的类型选择不同的图标
  int get iconName {
    return device == Device.WIN ? 0xe6b3 : 0xe61c;
  }

  // 判断登录设备的系统类型
  String get deviceName {
    return device == Device.WIN ? 'Windows' : 'Mac';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 24.0,
        top: 14.0,
        right: 24.0,
        bottom: 14.0,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: AppConstants.DividerWidth, color: Color(AppColors.DividerColor)),
          bottom: BorderSide(width: AppConstants.DividerWidth, color: Color(AppColors.DividerColor)),
        ),
        color: Color(AppColors.DeviceInfoItemBg)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(width: 8.0,),
          Icon(
            IconData(
              this.iconName,
              fontFamily: AppConstants.IconFontFamily,
            ), 
            size: 24.0,
            color: Color(AppColors.DeviceInfoItemIcon),
          ),
          SizedBox(width: 24.0,),
          Text('$deviceName 微信已登录，手机通知已关闭。', style: AppStyles.DeviceInfoItemTextStyle,)
        ],
      ),
    );
  }
}