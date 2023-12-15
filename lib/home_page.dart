import 'package:flutter/material.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:flutter_study/routers/routers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, String> map = {
    '弹框dialog': Routes.dialogDemoPage,
    '微信支付': Routes.weixinPayPage,
    '支付宝支付': Routes.aliPayPage,
    '商场首页':Routes.shopHomePage,
    '刷新':Routes.shopHomePage,
    'webView':Routes.webView

  };

  @override
  Widget build(BuildContext context) {
    List<String> titleList = map.keys.toList();
    List<String> routeList = map.values.toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              NavigatorUtils.push(context, routeList[index]);
            },
            child: ListTile(
              title: Text(
                titleList[index],
                style: TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          );
        },
        itemCount: titleList.length,
      ),
    );
  }
}
