import 'package:flutter/material.dart';

class DialogDemoPage extends StatelessWidget {
  const DialogDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹框demo",style: TextStyle(color: Colors.black,fontSize: 16),),
      ),
    );
  }
}
