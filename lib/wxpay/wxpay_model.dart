// To parse this JSON data, do
//
//     final wxPayModel = wxPayModelFromJson(jsonString);

import 'dart:convert';

WxPayModel wxPayModelFromJson(String str) => WxPayModel.fromJson(json.decode(str));

String wxPayModelToJson(WxPayModel data) => json.encode(data.toJson());

class WxPayModel {
  String? appid;
  String? partnerid;
  String? prepayid;
  String? package;
  String? noncestr;
  String? timestamp;
  String? sign;

  WxPayModel({
    this.appid,
    this.partnerid,
    this.prepayid,
    this.package,
    this.noncestr,
    this.timestamp,
    this.sign,
  });

  factory WxPayModel.fromJson(Map<String, dynamic> json) => WxPayModel(
    appid: json["appid"],
    partnerid: json["partnerid"],
    prepayid: json["prepayid"],
    package: json["package"],
    noncestr: json["noncestr"],
    timestamp: json["timestamp"],
    sign: json["sign"],
  );

  Map<String, dynamic> toJson() => {
    "appid": appid,
    "partnerid": partnerid,
    "prepayid": prepayid,
    "package": package,
    "noncestr": noncestr,
    "timestamp": timestamp,
    "sign": sign,
  };
}
