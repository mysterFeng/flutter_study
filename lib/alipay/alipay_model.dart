// To parse this JSON data, do
//
//     final alipayModel = alipayModelFromJson(jsonString);

import 'dart:convert';

AlipayModel alipayModelFromJson(String str) => AlipayModel.fromJson(json.decode(str));

String alipayModelToJson(AlipayModel data) => json.encode(data.toJson());

class AlipayModel {
  String? userId;
  String? appId;
  String? outTradeNo;
  String? productCode;
  int? totalAmount;
  String? suboject;
  String? orderstring;

  AlipayModel({
    this.userId,
    this.appId,
    this.outTradeNo,
    this.productCode,
    this.totalAmount,
    this.suboject,
    this.orderstring,
  });

  factory AlipayModel.fromJson(Map<String, dynamic> json) => AlipayModel(
    userId: json["userID"],
    appId: json["appID"],
    outTradeNo: json["out_trade_no"],
    productCode: json["product_code"],
    totalAmount: json["totalAmount"],
    suboject: json["suboject"],
    orderstring: json["orderstring"],
  );

  Map<String, dynamic> toJson() => {
    "userID": userId,
    "appID": appId,
    "out_trade_no": outTradeNo,
    "product_code": productCode,
    "totalAmount": totalAmount,
    "suboject": suboject,
    "orderstring": orderstring,
  };
}
