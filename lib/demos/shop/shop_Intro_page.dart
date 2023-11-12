import 'package:flutter/material.dart';
import 'package:flutter_study/common/widget/layout_log_print.dart';
import 'package:flutter_study/common/widget/my_tab_bar.dart';
import 'package:flutter_study/common/widget/navigation_bar.dart';
import 'package:flutter_study/res/resources.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';

import 'goods_list_page.dart';

class ShopIntroPage extends StatefulWidget {
  const ShopIntroPage({super.key});

  @override
  State<ShopIntroPage> createState() => _ShopIntroPageState();
}

class _ShopIntroPageState extends State<ShopIntroPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ["为你推荐", "近期热卖", "最新上架", "限量商品"];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
        child: Column(
          children: [
            MyNavigationBar(
              height: 30,
              child: _appBar,
            ),
            Gaps.vGap24,
            _cateGridView,
            _tabbar,
            Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    GoodsListPage(type: "0" ,),
                    GoodsListPage(type: "1",),
                    GoodsListPage(type: "2",),
                    GoodsListPage(type: "3",),

                  ],
                ),
            )
          ],
        ),
      ),
    );
  }

  /// appbar
  Widget get _appBar {
    return Container(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                InkWell(
                  child: Icon(Icons.arrow_back_ios, size: 18.0),
                  onTap: () {
NavigatorUtils.goBack(context);
                  },
                ),
                const Text(
                  "虚拟商场",
                  style: TextStyles.textBold18,
                )
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Icon(Icons.search),
                onTap: () {},
              ))
        ],
      ),
    );
  }

  /// 分类
  Widget get _cateGridView {
    return SizedBox(
      height: 67.0,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 66.0,
            maxCrossAxisExtent: 67.0,
          ),
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  ClipOval(
                      child: Container(
                    width: 46,
                    height: 46,
                    color: Colors.yellow,
                  )),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Text(
                        "全部分类",
                        style: TextStyles.text,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  /// tabbar
  Widget get _tabbar {
    return Container(
      color: Colors.white,
      height: 40,
      alignment: Alignment.centerLeft,
      child: LayoutLogPrint(
        child: MyTabBar(
          controller: _tabController,
          tabs: _tabs
              .map((e) => Tab(
                   child: Text(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
