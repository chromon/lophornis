import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:lophornis/constants.dart' show Constants, AppColor, AppStyles;

class FunctionItemWidget extends StatelessWidget {

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
  // 是否显示向右箭头
  final bool showArrow;
  // 自定义控件
  final Widget customWidget;

  // 列表项高度
  static const HEIGHT = Constants.FullWidthIconButtonIconSize + Constants.VERTICAL_PADDING * 2;
  // tag 图片大小
  static const TAG_IMG_SIZE = 28.0;
  // tag 图片大号
  static const TAG_IMG_SIZE_BIG = 32.0;
  // 圆点
  static const DOT_RADIUS = 5.0;

  const FunctionItemWidget({
    @required this.iconPath,
    @required this.title,
    @required this.onPressed,
    this.showDivider = false,
    this.desc,
    this.showArrow = true,
    this.customWidget
  }) : assert(iconPath != null),
       assert(title != null),
       assert(onPressed != null);

  @override
  Widget build(BuildContext context) {

    // 分隔线
    final Border _border = showDivider ? Border(
      bottom: BorderSide(
        color: const Color(AppColor.DividerColor),
        width: Constants.DividerWidth
      ),
    ) : null;

    // 按钮右侧部分，判断是否需要添加标签（new tag），描述信息
    final _rightAreaElements = <Widget>[];
    
    // 添加默认 tag 与描述信息不同时出现
    if (this.customWidget != null) {
      // 右侧按钮添加标签
      _rightAreaElements..add(Text(this.title, style: AppStyles.TitleStyle,))
        ..add(Expanded(child: customWidget,)
      );
    } else if (this.desc != null) {
      // 右侧按钮添加描述信息
      _rightAreaElements..add(Text(this.title, style: AppStyles.TitleStyle,))
      ..add(
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(this.desc, style: AppStyles.ButtonDescTextStyle),
          ),
        ),
      );
    } else {
      // 标题
      _rightAreaElements.add(
        Expanded(child: Text(this.title, style: AppStyles.TitleStyle,),)
      );
    }
    // 右侧箭头
    if (this.showArrow) {
      _rightAreaElements.add(arrowRight());
    }
    // 右侧添加边距
    _rightAreaElements.add(SizedBox(width: Constants.HORIZONTAL_PADDING),);

    // 按钮
    final _button = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          iconPath,
          width: Constants.FullWidthIconButtonIconSize,
          height: Constants.FullWidthIconButtonIconSize,
        ),
        SizedBox(width: Constants.HORIZONTAL_PADDING,),
        Expanded(
          child: Container(
            height: HEIGHT,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: _border,
            ),
            child: Row(children: _rightAreaElements),
          ),
        ),
      ],
    );

    return FlatButton(
      onPressed: onPressed,
      padding: EdgeInsets.only(
        left: Constants.HORIZONTAL_PADDING,
      ),
      color: Colors.white,
      child: _button,
    );
  }

  // 按钮上的描述性文字控件
  // * [des] 显示在文本上的信息
  static Text descText(final desc) {
    return Text(desc, style: AppStyles.ButtonDescTextStyle);
  }

  // 按钮上的圆角文本标签控件（如：NEW 标签）
  static Widget tag(final content) {
    return Container(
      height: 20.0,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 6.0),
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      decoration: BoxDecoration(
        color: const Color(AppColor.NewTagBg),
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Text(content, style: AppStyles.NewTagTextStyle),
    );
  }

  // 按钮上的图片标签，可以根据 path 内容自动生成 assets 或 网络上的图片
  // path 图片文件路径或 URL
  // showDot 是否需要显示图标右上角的圆点
  // isBig 图标的大小
  static Widget iconTag(final String path, {bool showDot = false, bool isBig = false}) {
    // 判断图片是否来源于网络
    bool network = false;
    if (path.startsWith('http') || path.startsWith('https')) {
      network = true;
    }

    // 圆角图片
    final _icon = ClipRRect(
      borderRadius: BorderRadius.circular(Constants.AvatarRadius),
      child: network ?
        Image.network(
          path,
          width: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
          height: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
          fit: BoxFit.contain,
        ) :
        Image.asset(
          path, 
          width: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
          height: isBig ? TAG_IMG_SIZE_BIG : TAG_IMG_SIZE,
          fit: BoxFit.contain,
        ),
    );

    // 显示图片上圆点
    if (showDot) {
      return Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _icon,
          Positioned(
            right: isBig ? -3.0 : -7.0,
            top: isBig ? -3.0 : -7.0,
            child: Container(
              width: DOT_RADIUS * 2,
              height: DOT_RADIUS * 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(DOT_RADIUS),
                color: const Color(AppColor.NotifyDotBg),
              ),
            ),
          ),
        ],
      );
    }

    return _icon;
  }

  // 按钮右边的指示箭头
  static Widget arrowRight() {
    return Container(
      alignment: Alignment.centerRight,
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