import 'dart:async';
import 'dart:convert';
import 'package:alipay_kit/alipay_kit.dart';
import 'package:flutter/material.dart';

class AlipayPage extends StatefulWidget {
  const AlipayPage({super.key});

  @override
  State<AlipayPage> createState() => _AlipayPageState();
}

class _AlipayPageState extends State<AlipayPage> {
  static const bool _ALIPAY_USE_RSA2 = true;
  static const String _ALIPAY_APPID = 'your alipay appId'; // 支付/登录
  static const String _ALIPAY_PID = 'your alipay pid'; // 登录
  static const String _ALIPAY_TARGETID = 'your alipay targetId'; // 登录
  static const String _ALIPAY_PRIVATEKEY =
      'your alipay rsa private key(pkcs1/pkcs8)'; // 支付/登录


//声明参数用于回调使用
  late final StreamSubscription<AlipayResp> _paySubs; //用于支付
  late final StreamSubscription<AlipayResp> _authSubs; //用于授权登陆


  @override
  void initState() {
    super.initState();
    _paySubs = AlipayKitPlatform.instance.payResp().listen(_listenPay);
    _authSubs = AlipayKitPlatform.instance.authResp().listen(_listenAuth);
  }

  void _listenPay(AlipayResp resp) {
    final String content = 'pay: ${resp.resultStatus} - ${resp.result}';
    _showTips('支付', content);
  }

  void _listenAuth(AlipayResp resp) {
    final String content = 'pay: ${resp.resultStatus} - ${resp.result}';
    _showTips('授权登录', content);
  }

  @override
  void dispose() {
    _paySubs.cancel();
    _authSubs.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alipay Kit Demo'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('环境检查'),
            onTap: () async {
              final String content =
                  'alipay: ${await AlipayKitPlatform.instance.isInstalled()}';
              _showTips('环境检查', content);
            },
          ),
          ListTile(
            title: Text('支付'),
            onTap: () {
              final Map<String, dynamic> bizContent = <String, dynamic>{
                'timeout_express': '30m',
                'product_code': 'QUICK_MSECURITY_PAY',
                'total_amount': '0.01',
                'subject': '1',
                'body': '我是测试数据',
                'out_trade_no': '123456789',
              };
              final Map<String, dynamic> orderInfo = <String, dynamic>{
                'app_id': _ALIPAY_APPID,
                'biz_content': json.encode(bizContent),
                'charset': 'utf-8',
                'method': 'alipay.trade.app.pay',
                'timestamp': '2016-07-29 16:55:53',
                'version': '1.0',
              };
              // AlipayKitPlatform.instance.unsafePay(
              //   orderInfo: orderInfo,
              //   signType: _ALIPAY_USE_RSA2
              //       ? UnsafeAlipayKitPlatform.SIGNTYPE_RSA2
              //       : UnsafeAlipayKitPlatform.SIGNTYPE_RSA,
              //   privateKey: _ALIPAY_PRIVATEKEY,
              // );
              AlipayKitPlatform.instance.pay(orderInfo: orderInfo.toString());
            },
          ),
          ListTile(
            title: Text('授权'),
            onTap: () {
              AlipayKitPlatform.instance.auth(authInfo: "authInfo",isShowLoading: true);

              // AlipayKitPlatform.instance.auth(
                // appId: _ALIPAY_APPID,
                // pid: _ALIPAY_PID,
                // targetId: _ALIPAY_TARGETID,
                // signType: _ALIPAY_USE_RSA2
                //     ? UnsafeAlipayKitPlatform.SIGNTYPE_RSA2
                //     : UnsafeAlipayKitPlatform.SIGNTYPE_RSA,
                // privateKey: _ALIPAY_PRIVATEKEY,
              // );
            },
          ),
        ],
      ),
    );
  }

  void _showTips(String title, String content) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );
  }
}
