import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lophornis/constants.dart' show Constants, AppColor, AppStyles;

class FullWidthIconButton extends StatelessWidget {

  // 列表项图标路径
  final String iconPath;
  // 列表项标题
  final String title;
  // 列表项回调
  final VoidCallback onPressed;

  // 是否显示分隔线
  final bool showDivider;
  // 描述信息
  final String desc;
  //
  final bool showArrow;

  const FullWidthIconButton({
    @required this.iconPath,
    @required this.title,
    @required this.onPressed,
    this.showDivider = false,
    this.desc,
    this.showArrow = true,
  }) : assert(iconPath != null),
       assert(title != null),
       assert(onPressed != null);

  @override
  Widget build(BuildContext context) {

    // 没有下划线的按钮
    final pureButton = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: Constants.FullWidthIconButtonIconSize,
          height: Constants.FullWidthIconButtonIconSize,
        ),
        SizedBox(width: Constants.HORIZONTAL_PADDING,),
        Expanded(
          child: Text(title, style: AppStyles.TitleStyle,),
        ),
      ],
    );

    // 处理提示信息
    if(this.desc != null) {
      pureButton.children.add(
        Text(this.desc, style: AppStyles.ButtonDescTextStyle,),
      );
    }

    // 处理右侧箭头
    if (this.showArrow) {
      pureButton.children.add(
        arrowRight(),
      );
    }

    // 带有下划线的按钮
    final borderedButton = Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(AppColor.DividerColor), width: Constants.DividerWidth)
        )
      ),
      padding: EdgeInsets.only(bottom: Constants.VERTICAL_PADDING),
      child: pureButton,
    );

    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(
        left: Constants.HORIZONTAL_PADDING,
        right: Constants.HORIZONTAL_PADDING,
        top: Constants.VERTICAL_PADDING,
        bottom: this.showDivider? 0.0 : Constants.VERTICAL_PADDING,
      ),
      color: Colors.white,
      child: this.showDivider ? borderedButton : pureButton,
    );
  }

  // 按钮右边的指示箭头
  static Widget arrowRight() {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Icon(
        IconData(
          0xe604,
          fontFamily: Constants.IconFontFamily,
        ),
        size: 16.0,
        color: const Color(AppColor.ButtonDescText)
      )
    );
  }
}