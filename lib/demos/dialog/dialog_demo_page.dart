import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_study/common/utils/screen_utils.dart';
import 'package:flutter_study/common/widget/my_gradient_button.dart';
import 'package:flutter_study/demos/dialog/dialog_util.dart';
import 'package:flutter_study/demos/dialog/pay_method_widget.dart';
import 'package:flutter_study/res/gaps.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:flutter_study/routers/routers.dart';

import 'money_drop_down_widget.dart';

class DialogDemoPage extends StatelessWidget {
  const DialogDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "弹框demo",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: ListView(
        children: [
          Builder(builder: (context) {
            return MyGradientButton(
                onPressed: () {
                  DialogUtil.showMyDropDownMenu(context, MoneyDropDownWidget());
                },
                text: "弹出菜单");
          }),
          MyGradientButton(onPressed: () {}, text: "弹出城市选择"),

          Row(
            children: [
              Spacer(),
              MyGradientButton(width: 300, onPressed: () {
                DialogUtil.showMyDialog(PayMethodWidget(),alignment: Alignment.bottomCenter);


              }, text: "弹出选择交易货币"),
              Spacer(),
            ],
          ),
          Builder(builder: (context) {
            return MyGradientButton(
                onPressed: () {
                  // _showSmartDiag();
                  // DialogUtil.showMyDropDownMenu(context, Container(color: Colors.red,width: 300,height: 100,));
                  // DialogUtil.showMyCustomLoading(Container(color: Colors.red,width: 100,height: 30,));
                  // DialogUtil.showMyDialog(Alignment.center, Container(color: Colors.red,height: 500,width: 300,));
                  // DialogUtil.showMyToast("msgaaaaa");

                  DialogUtil.showMyDialog(_showMyShareView(),
                      clickMaskDismiss: false);
                },
                text: "好友分享弹框");
          }),
          MyGradientButton(
            text: "渐变按钮",
            onPressed: () {},
            disabled: true,
          ),
          MyGradientButton(text: "封装按钮2", onPressed: () {}),
          Row(
            children: [
              MyGradientButton(
                  text: "添加收获地址",
                  width: 100,
                  textColor: Colors.blue,
                  backgroundColor: Colors.black,
                  borderColor: Colors.blue,
                  borderWidth: 1.5,
                  onPressed: () {
                    NavigatorUtils.push(context, Routes.addAddressPage);
                  }),
            ],
          ),
          MyGradientButton(text: "列表滑动删除", onPressed: () {}),
        ],
      ),
    );
  }

  _showSmartDiag() {
    SmartDialog.showAttach(
        targetContext: null,
        alignment: Alignment.bottomCenter,
        targetBuilder: (_, __) {
          return Offset(100, 100);
        },
        builder: (context) {
          return Container(
            color: Colors.red,
            height: 100,
            width: 300,
          );
        });
  }

  void showCustomOverlay(BuildContext context) {
    RenderBox button = context.findRenderObject() as RenderBox;
    Offset buttonPosition = button.localToGlobal(Offset.zero);

    OverlayState? overlayState = Overlay.of(context);

    // 创建 OverlayEntry
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return Positioned(
            top: buttonPosition.dy + button.size.height,
            left: buttonPosition.dx,
            child: GestureDetector(
                onTap: () {},
                child: Container(
                  color: Colors.red,
                  width: 500,
                  height: 300,
                )));
      },
    );

    // 将 OverlayEntry 添加到 Overlay 中
    Overlay.of(context).insert(overlayEntry);
  }

  _showMyShareView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.black,
          width: 240,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.vGap15,
              Text(
                "好友给你分享了",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Gaps.vGap15,
              Container(
                color: Colors.red,
                width: 170,
                height: 170,
              ),
              Gaps.vGap16,
              Text(
                "这是商品",
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15.0),
                height: 36.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18.0),
                    color: Colors.blue),
                child: Center(
                  child: Text(
                    "立即查看",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              Gaps.vGap16,
            ],
          ),
        ),
        Gaps.vGap24,
        InkWell(
          onTap: () {
            DialogUtil.dismiss();
          },
          child: Icon(
            Icons.close_sharp,
            size: 28,
            color: Colors.white,
          ),
        )
      ],
    );
  }



}












