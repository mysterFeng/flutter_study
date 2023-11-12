import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/common/utils/theme_utils.dart';

enum StatusStyle { LIGHT_CONTENT, DARK_CONTENT }

///可自定义样式的沉浸式导航栏
class MyNavigationBar extends StatefulWidget {
  final StatusStyle statusStyle;
  final Color color;
  final double height;
  final Widget child;

  const MyNavigationBar(
      {super.key,
      this.statusStyle = StatusStyle.DARK_CONTENT,
      this.color = Colors.white,
      this.height = 46,
      required this.child});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Color bgColor = widget.color ?? context.backgroundColor;
    final SystemUiOverlayStyle overlayStyle =
        ThemeData.estimateBrightnessForColor(bgColor) == Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    //状态栏高度
    var top = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: overlayStyle,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: top + widget.height,
          padding: EdgeInsets.only(top: top),
          decoration: BoxDecoration(color: widget.color),
          child: widget.child,
        ));
  }
}
