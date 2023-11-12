import 'package:flutter/material.dart';
import 'package:flutter_study/common/widget/navigation_bar.dart';
import 'package:flutter_study/res/resources.dart';

///全部分类
class GoodsAllCategoryPage extends StatefulWidget {
  const GoodsAllCategoryPage({super.key});

  @override
  State<GoodsAllCategoryPage> createState() => _GoodsAllCategoryPageState();
}

class _GoodsAllCategoryPageState extends State<GoodsAllCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        MyNavigationBar(
          color: Colors.white,
          child: _appBar,
        ),
        _filterView,
        Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemExtent: 80,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("-------$index"),
                  );
                }))
      ],
    ));
  }

  Widget get _appBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.black,
            )),
        const Text(
          "标题",
          style: TextStyles.textBold18,
        ),
        TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.search,
              size: 18,
              color: Colors.black,
            )),
      ],
    );
  }

  Widget get _filterView {
    return Container(
      color: Colors.red,
      height: 50,
    );
  }
}
