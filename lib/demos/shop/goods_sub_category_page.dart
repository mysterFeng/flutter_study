import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_study/common/utils/common_utils.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

import '../../common/widget/navigation_bar.dart';
import '../../res/styles.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({required this.name, required this.isSelected});
}

///商品二级分类
class GoodsSubCategoryPage extends StatefulWidget {
  const GoodsSubCategoryPage({super.key});

  @override
  State<GoodsSubCategoryPage> createState() => _GoodsSubCategoryPageState();
}

class _GoodsSubCategoryPageState extends State<GoodsSubCategoryPage> {
  List<String> _headerStrings = ['综合', '销量', '价格', '筛选'];

  final GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _stackKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('_GZXDropDownMenuTestPageState.build');

    return Scaffold(
        key: _scaffoldKey,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              elevation: 0,
            )),
        body: Stack(
          key: _stackKey,
          children: [
            Column(
              children: [
                MyNavigationBar(
                  color: Colors.white,
                  child: _appBar,
                ),
                _filterHeaderView,
                Expanded(
                    child: MediaQuery.removePadding(
                  removeTop: true,
                  removeBottom: true,
                  removeLeft: true,
                  removeRight: true,
                  context: context,
                  child: ListView.builder(
                      itemCount: 50,
                      itemBuilder: (context, index) {
                        return Container(
                          color: CommonUtils.randomColor(),
                          height: 80,
                          child: ListTile(
                            title: Text("-------$index"),
                          ),
                        );
                      }),
                ))
              ],
            ),
            GZXDropDownMenu(
              controller: _dropdownMenuController,
              menus: [
                GZXDropdownMenuBuilder(
                    dropDownHeight: 80, dropDownWidget: Container()),
                GZXDropdownMenuBuilder(
                    dropDownHeight: 80, dropDownWidget: Container()),
                GZXDropdownMenuBuilder(
                    dropDownHeight: 80, dropDownWidget: Container()),
              ],
            ),
          ],
        ));
  }

  Widget get _appBar {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
            onPressed: () {
              NavigatorUtils.goBack(context);
            },
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

  Widget get _filterHeaderView {
    return
      Container(
      child: Builder(
        builder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("111"),
              Text("222"),
              Text("333"),
              InkWell(
                child: Text("444"),
                onTap: () {
                  _attachA(context);
                },
              ),
            ],
          );
        }
      ),
    );
  }

  void _attachA(BuildContext context) {
    SmartDialog.showAttach(
      targetContext: context,
      alignment: Alignment.bottomCenter,
      highlightBuilder: (Offset targetOffset, Size targetSize) {
        return Positioned(
          child: Container(
            height: targetOffset.dy + targetSize.height,
            width: targetSize.width,
            color: Colors.white,
          ),
        );
      },
      builder: (_) => Container(
        color: Colors.red,
        width: double.infinity,
        height: 300,
      ),
    );
  }
}
