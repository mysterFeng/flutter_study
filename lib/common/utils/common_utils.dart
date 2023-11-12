import 'package:flutter/material.dart';
import 'dart:math' as math;

class CommonUtils {

  ///随机色
  static Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }

  ///String转Color
  static Color string2Color(String colorString) {
    int? value = 0x00000000;

    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      value = int.tryParse(colorString, radix: 16);
      if (value != null) {
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value!);
  }

  ///弹出 dialog
  static Future<T?> showMYDialog<T>({
    required BuildContext context,
    bool barrierDismissible = true,
    required WidgetBuilder builder,
  }) {
    return showDialog<T>(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return MediaQuery(
            ///不受系统字体缩放影响
              data: MediaQueryData.fromView(WidgetsBinding.instance.window)
                  .copyWith(textScaleFactor: 1),
              child:  SafeArea(child: builder(context)));
        });
  }

  static Future<void> showPromptDialog(BuildContext context, String title, String contentMsg) {
    return showMYDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text(title),
            content:  Text(contentMsg),
            actions: <Widget>[
              TextButton(
                 onPressed: () {
                   Navigator.pop(context);
                 },
                 child: new Text('取消')),
              TextButton(
                  onPressed: () {
//                    launch(Address.updateUrl);
                    Navigator.pop(context);
                  },
                  child:  Text('确定')),
            ],
          );
        });
  }


}