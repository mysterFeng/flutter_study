import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../common/widget/loading_container.dart';

///商城首页列表
class GoodsListPage extends StatefulWidget {
  const GoodsListPage({super.key, required this.type});
  final String type ;
  @override
  State<GoodsListPage> createState() => _GoodsListPageState();
}

class _GoodsListPageState extends State<GoodsListPage> {
  Color color = Colors.black;
  bool _loading = false;
  int pageIndex = 1;
  int count = 10;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switch (widget.type) {
      case "0": color = Colors.red;
        break;
      case "1": color = Colors.cyan;
        break;
      case "2":color = Colors.blue;
        break;
      case "3":color = Colors.yellow;
        break;
    }
    _loadData();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(loadMore: true);
      }
    });
  }
  Future<Null> _handleRefresh() async {
    _loadData();
    return null;
  }
  void _loadData({loadMore = false}) {
    if (loadMore) {
      pageIndex++;
    } else {
      pageIndex = 1;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child:MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: count,
            itemBuilder: (context, index) {
              return Container(color: Colors.grey,height: index % 2 == 0? 254:271,);
            },
          )),
    );
  }
}
