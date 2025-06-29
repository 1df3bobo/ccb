import 'package:ccb/pages/tabs/new_life/view.dart';
import 'package:flutter/cupertino.dart';
import '../tabs/new_card/card_page/card_page/view.dart';
import '../tabs/home/home_view.dart';
// import '../tabs/life/life_view.dart'; // No longer needed
import '../tabs/mine/mine_view.dart';
import '../tabs/wealth/wealth_view.dart';

class IndexState {


  /// 页面放到数组中
  /// EssencePageWidget
  /// InheritedWidgetTestContainer
  late List<Widget> pageList;


  ///appTabList
  late List<Map> appBarList;


  /// item
  late List<BottomNavigationBarItem>  item;


  IndexState() {
    ///Initialize variables

    pageList = [
      HomePage(),
      CardPagePage(),

      WealthPage(),
      NewLifePage(),
      MinePage(),
    ];


    ///#2B55F2
    ///#4CAED7
    ///#C98A34
    ///#E98C3E
    ///#7892F3
    appBarList = const [
      {"title":"首页", "icon":"tabbar",'index':0,'selectColor':0xff2B55F2},
      {"title":"信用卡", "icon":"tabbar",'index':1,'selectColor':0xff4CAED7},
      {"title":"财富", "icon":"tabbar",'index':2,'selectColor':0xffC98A34},
      {"title":"生活", "icon":"tabbar",'index':3,'selectColor':0xffE98C3E},
      {"title":"我的", "icon":"tabbar",'index':4,'selectColor':0xff7892F3},
    ];


  }
}
