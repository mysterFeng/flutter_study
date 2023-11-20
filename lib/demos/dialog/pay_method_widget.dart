import 'package:flutter/material.dart';
import 'package:flutter_study/common/constant/constant.dart';
import 'package:flutter_study/res/gaps.dart';

class PayMethodWidget extends StatefulWidget {
  const PayMethodWidget({super.key});

  @override
  State<PayMethodWidget> createState() => _PayMethodWidgetState();
}

class _PayMethodWidgetState extends State<PayMethodWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kmargin),
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Spacer(),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "选择交易货币",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        textBaseline: TextBaseline.alphabetic),
                  )),
              Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.close,
                      size: 12,
                      color: Colors.white,
                    )),
              )
            ],
          ),
          Gaps.vGap16,
          buildRowItem("人民比"),
          buildRowItem("钻石"),
          buildRowItem("元积分"),
          buildRowItem("金币"),
          Gaps.vGap50,
        ],
      ),
    );
  }

  Widget buildRowItem(String text) => Container(
    height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: TextStyle(color: Colors.white,fontSize: 14),),
            Row(
              children: [
                Icon(
                  Icons.check_box_outline_blank_outlined,
                  color: Colors.white,
                  size: 16,
                ),
                Text("888",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            )
          ],
        ),
      );
}
