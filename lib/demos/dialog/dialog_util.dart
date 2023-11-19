
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class DialogUtil {

  ///弹出方向
  ///centerLeft  左
  ///topCenter   上
  ///centerRight  右
  ///bottomCenter 下
  ///Center 中心
  static showMyDialog(Widget child,{bool clickMaskDismiss = true,AlignmentGeometry alignment = Alignment.center}) {
    SmartDialog.show(
        alignment: alignment,
        clickMaskDismiss: clickMaskDismiss,
        animationType: SmartAnimationType.centerFade_otherSlide,
        builder: (_)=>child);
  }

  static showMyToast(String msg) {
    SmartDialog.showToast(msg);
  }
  static showMyLoading() {
    SmartDialog.showLoading();
  }

  ///自定义loading
  static showMyCustomLoading(Widget child) {
    SmartDialog.showLoading(
      animationType: SmartAnimationType.scale,
      builder: (_) => child,
    );
  }

  ///消失
  static dismiss() {
    SmartDialog.dismiss();
  }

  ///暂时没用
  static showMySuccess(String msg) {
    SmartDialog.showNotify(msg: msg, notifyType: NotifyType.success);
  }
  static showMyFailure(String msg) {
    SmartDialog.showNotify(msg: msg, notifyType: NotifyType.failure);
  }
  static showMyWarning(String msg) {
    SmartDialog.showNotify(msg: msg, notifyType: NotifyType.warning);
  }
  static showMyError(String msg) {
    SmartDialog.showNotify(msg: msg, notifyType: NotifyType.error);
  }
  static showMyAlert(String msg) {
    SmartDialog.showNotify(msg: msg, notifyType: NotifyType.alert);
  }


///下拉筛选菜单
  static showMyDropDownMenu(BuildContext context,Widget child) {
    SmartDialog.showAttach(
      targetContext: context,
      alignment: Alignment.bottomCenter,
      highlightBuilder: (Offset targetOffset, Size targetSize) {
        return Positioned(
          child: Container(
            height: targetOffset.dy + targetSize.height,
            width: targetSize.width,
            color: Colors.white,
          ),
        );
      },
      builder: (_) => child,
    );
  }


}