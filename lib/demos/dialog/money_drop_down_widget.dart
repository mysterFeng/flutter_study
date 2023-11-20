
import 'package:flutter/material.dart';

import '../../common/utils/screen_utils.dart';
import '../../common/widget/my_gradient_button.dart';
import '../../res/gaps.dart';

class MoneyDropDownWidget extends StatefulWidget {
  const MoneyDropDownWidget({super.key});

  @override
  State<MoneyDropDownWidget> createState() => _MoneyDropDownWidgetState();
}

class _MoneyDropDownWidgetState extends State<MoneyDropDownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      padding: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("交易币种",style: TextStyle(color: Colors.white),),
          Gaps.vGap10,
          Wrap(
            alignment: WrapAlignment.start,
            runSpacing: 10.0,
            spacing: 8.0,
            children: [
              MyGradientButton(
                  width: (Screen.width(context) - 14*2 - 8*2)/3,
                  borderWidth: 1.0,
                  borderRadius: 3.0,
                  borderColor: Colors.blue,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "钻石", onPressed: (){}),
              MyGradientButton(
                  width: (Screen.width(context) - 14*2 - 8*2)/3,

                  borderWidth: 1.0,
                  borderRadius: 3.0,
                  borderColor: Colors.white,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "元积分", onPressed: (){}),
              MyGradientButton(
                  width: (Screen.width(context) - 14*2 - 8*2)/3,

                  borderWidth: 1.0,
                  borderRadius: 3.0,
                  borderColor: Colors.white,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "金币", onPressed: (){}),
              MyGradientButton(
                  width: (Screen.width(context) - 14*2 - 8*2)/3,

                  borderWidth: 1.0,
                  borderRadius: 3.0,
                  borderColor: Colors.white,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  text: "人民币", onPressed: (){}),

            ],
          ),
          Gaps.vGap32,
          Row(children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 28.0),
              child: Text("重置",style: TextStyle(color: Colors.white,fontSize: 13),),
            ),
            Expanded(
              child: MyGradientButton(
                  height: 30,
                  borderRadius: 15.0,
                  text: "确定", onPressed: (){

              }),
            )
          ],)
        ],
      ),
    );
  }
}
