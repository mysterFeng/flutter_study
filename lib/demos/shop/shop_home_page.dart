import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_study/common/widget/my_sliver_persistent_header.dart';
import 'package:flutter_study/common/widget/navigation_bar.dart';
import 'package:flutter_study/demos/shop/goods_list_page.dart';
import 'package:flutter_study/res/resources.dart';
import 'package:flutter_study/routers/fluro_navigator.dart';
import 'package:flutter_study/routers/routers.dart';
import 'package:underline_indicator/underline_indicator.dart';

class ShopHomePage extends StatefulWidget {
  const ShopHomePage({super.key});

  @override
  State<ShopHomePage> createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ["为你推荐", "最新上架", "积分专区", "限量商品"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyNavigationBar(
            color: Colors.white,
            child: _searchBar,
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: NestedScrollView(
            headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverToBoxAdapter(
                    child: _shopGridView,
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "分类",
                        style: TextStyles.textBold14,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _cateGridView,
                  ),
                  SliverToBoxAdapter(
                    child: _hotGoodsGridView,
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: MySliverPersistentHeader(
                      minHeight: 40,
                      maxHeight: 40,
                      child: Container(
                        color: Colors.white,
                        child: TabBar(
                            controller: _tabController,
                            isScrollable: true,
                            labelColor: Colors.black,
                            labelPadding:
                                const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            indicator: const UnderlineIndicator(
                                strokeCap: StrokeCap.round,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 0.5,
                                ),
                                insets: EdgeInsets.only(bottom: 10)),
                            tabs: _tabs.map<Tab>((String title) {
                              return Tab(
                                text: title,
                              );
                            }).toList()),
                      ),
                    ),
                  )
                ];
            },
            body: TabBarView(
                controller: _tabController,
                children: const [
                  GoodsListPage(
                    type: "0",
                  ),
                  GoodsListPage(
                    type: "1",
                  ),
                  GoodsListPage(
                    type: "2",
                  ),
                  GoodsListPage(
                    type: "3",
                  ),
                ],
            ),
          ),
              ))
        ],
      ),
    );
  }

  ///商场入口
  Widget get _shopGridView {
    return Container(
        margin: const EdgeInsets.only(top: 16),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: InkWell(
                  onTap: () {
                    NavigatorUtils.push(context, Routes.shopIntroPage);
                  },
                  child: Container(color: Colors.cyan)),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(color: Colors.red),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: Container(color: Colors.blue),
            ),
          ],
        ));
  }

  ///分类入口
  Widget get _cateGridView {
    return Container(
      height: 186,
      child: GridView.builder(
          padding: const EdgeInsets.only(top: 16, bottom: 20),
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 16,
              crossAxisSpacing: 30,
              mainAxisExtent: (186 - 32 - 20) / 2),
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  if (index == 0) {
                    NavigatorUtils.push(context, Routes.goodsRoleCategoryPage);
                  } else if (index == 1) {
                    NavigatorUtils.push(context, Routes.goodsSubCategoryPage);
                  } else {
                    NavigatorUtils.push(context, Routes.goodsAllCategoryPage);
                  }
                },
                child: Container(color: Colors.red));
          }),
    );
  }

  ///热门商品
  Widget get _hotGoodsGridView {
    return Container(
      height: 186,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), color: Colors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 8),
            child: Text(
              "热门商品",
              style: TextStyles.textBold18,
            ),
          ),
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 136,
                  mainAxisExtent: 100,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.green,
                  );
                }),
          ),
        ],
      ),
    );
  }

  ///搜索框
  Widget get _searchBar {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gaps.hGap12,
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, top: 6, bottom: 6),
                    child: Text(
                      "新版盲盒-上下滚动热门商品名",
                      style: TextStyles.textGray12,
                    ),
                  ),
                ),
                Container(
                  width: 52,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.black,
                      border: Border.all(color: Colors.black)),
                  child: TextButton(
                    child: const Text(
                      "搜索",
                      style: TextStyles.textSize12,
                    ),
                    onPressed: () {},
                  ),
                ),
                Gaps.hGap4,
              ],
            ),
          ),
        ),
        Gaps.hGap10,
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.collections,
              size: 15.0,
            ),
            Text(
              "我的收藏",
              style: TextStyles.textGray12,
            )
          ],
        ),
        Gaps.hGap10,
        const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.ondemand_video,
              size: 15.0,
            ),
            Text(
              "订单",
              style: TextStyles.textGray12,
            )
          ],
        ),
        Gaps.hGap12,

      ],
    );
  }
}
