import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/demos/shop/add_adress_page.dart';
import 'package:flutter_study/demos/shop/goods_all_category_page.dart';
import 'package:flutter_study/demos/shop/goods_list_page.dart';
import 'package:flutter_study/demos/shop/goods_role_category_page.dart';
import 'package:flutter_study/demos/shop/goods_sub_category_page.dart';
import 'package:flutter_study/test/gzx_dropdown_menu_test_page.dart';
import 'package:flutter_study/demos/shop/shop_Intro_page.dart';
import 'package:flutter_study/demos/shop/shop_home_page.dart';
import 'package:flutter_study/home_page.dart';

import '../demos/dialog/dialog_demo_page.dart';
import 'i_router.dart';
import 'not_found_page.dart';

class Routes {

  static String home = '/home';
  static String webViewPage = '/webView';
  static String dialogDemoPage = '/dialogDemoPage';
  static String weixinPayPage = '/weixinPayPage';
  static String aliPayPage = '/aliPayPage';
  static String shopHomePage = '/shopHomePage';
  static String goodsListPage = '/goodsListPage';
  static String shopIntroPage = '/shopIntroPage';
  static String goodsAllCategoryPage = '/goodsAllCategoryPage';
  static String goodsSubCategoryPage = '/goodsSubCategoryPage';
  static String goodsRoleCategoryPage = '/goodsRoleCategoryPage';
  static String gzxDropDownMenuTestPage = '/gzxDropDownMenuTestPage';
  static String addAddressPage = '/addAddressPage';



  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        debugPrint('未找到目标页');
        return const NotFoundPage();
      });

    router.define(home, handler: Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const MyHomePage(title: "首页")));
    router.define(dialogDemoPage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const DialogDemoPage()));
    router.define(shopHomePage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const ShopHomePage()));
    router.define(shopHomePage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          final String type = params['type']?.first ?? '';
          return GoodsListPage(type: type);
        }));
    router.define(shopIntroPage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const ShopIntroPage()));

    router.define(goodsAllCategoryPage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const GoodsAllCategoryPage()));
    router.define(goodsRoleCategoryPage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const GoodsRoleCategoryPage()));
    router.define(goodsSubCategoryPage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const GoodsSubCategoryPage()));
    router.define(addAddressPage, handler: Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>  AddAddressPage()));
    // router.define(gzxDropDownMenuTestPage, handler: Handler(
    //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>  GZXDropDownMenuTestPage()));

    ///由于需要真机调试暂时屏蔽
    // router.define(weixinPayPage, handler: Handler(
    //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const WeXinPayPage()));
    // router.define(aliPayPage, handler: Handler(
    //     handlerFunc: (BuildContext? context, Map<String, List<String>> params) => const AlipayPage()));




    // router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
    //   final String title = params['title']?.first ?? '';
    //   final String url = params['url']?.first ?? '';
    //   return WebViewPage(title: title, url: url);
    // }));

    _listRouter.clear();
    // /// 各自路由由各自模块管理，统一在此添加初始化
    // _listRouter.add(ShopRouter());
    // _listRouter.add(LoginRouter());
    // _listRouter.add(GoodsRouter());
    // _listRouter.add(OrderRouter());
    // _listRouter.add(StoreRouter());
    // _listRouter.add(AccountRouter());
    // _listRouter.add(SettingRouter());
    // _listRouter.add(StatisticsRouter());
  
    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }
    _listRouter.forEach(initRouter);
  }
}


