import 'package:flutter/material.dart';
import 'package:underline_indicator/underline_indicator.dart';

///顶部tab切换组件
class MyTabBar extends StatelessWidget {
  final List<Widget> tabs;
  final TabController controller;
  final double fontSize;
  final double borderWidth;
  final double insets;
  final Color unselectedLabelColor;

  const MyTabBar({super.key,required this.controller,required this.tabs,
    this.fontSize = 13,
    this.borderWidth = 2,
    this.insets = 15,
    this.unselectedLabelColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: controller,
        isScrollable: true,
        labelColor: Colors.black,
        labelPadding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        unselectedLabelColor: unselectedLabelColor,
        labelStyle: TextStyle(fontSize: fontSize),
        indicator: UnderlineIndicator(
            strokeCap: StrokeCap.round,
            borderSide: BorderSide(color: Colors.transparent, width: borderWidth),
            insets: EdgeInsets.only(left: insets, right: insets)),
        tabs: tabs);
  }
}
