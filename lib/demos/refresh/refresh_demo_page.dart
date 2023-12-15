import 'package:flutter/material.dart';

class RefreshDemoPage extends StatefulWidget {
  const RefreshDemoPage({super.key});

  @override
  State<RefreshDemoPage> createState() => _RefreshDemoPageState();
}

class _RefreshDemoPageState extends State<RefreshDemoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("aaaa"),),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,index){
        return Text("data");
      }),
    );
  }
}
