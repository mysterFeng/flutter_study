import 'package:flutter/material.dart';

class DialogDemoPage extends StatelessWidget {
  const DialogDemoPage({super.key});

  @override
  Widget build(BuildContext context) {

    AlertDialog(
      title: Text("提示"),
      content: Text("您确定要删除当前文件吗?"),
      actions: <Widget>[
        TextButton(
          child: Text("取消"),
          onPressed: () => Navigator.of(context).pop(), //关闭对话框
        ),
        TextButton(
          child: Text("删除"),
          onPressed: () {
            // ... 执行删除操作
            Navigator.of(context).pop(true); //关闭对话框
          },
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("DialogDemoPage",style: TextStyle(color: Colors.black,fontSize: 16),),
      ),
      body: ListView(
        children: [
          TextButton(onPressed: (){
          }, child: Text("对话框")),
          TextButton(onPressed: (){}, child: Text("对话框")),

        ],
      ),
    );
  }
}
