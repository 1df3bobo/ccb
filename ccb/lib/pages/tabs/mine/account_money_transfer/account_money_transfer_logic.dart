import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../data/model/contacts_list_model.dart';
import 'account_money_transfer_state.dart';

class AccountMoneyTransferLogic extends GetxController {
  final AccountMoneyTransferState state = AccountMoneyTransferState();

  var showMore = false.obs;


  @override
  void onInit() {
    super.onInit();

    Http.get(Apis.contactsList).then((v){
      if(v is List){
        state.contactsList =  v.map((e) => ContactsListModel.fromJson(e)).toList();
      }
      update(['updateBanList']);
    });
  }

  void jumpPage(int index){
    if(index == 0){
      //预约转账
      Get.toNamed(Routes.naviOffset, arguments: {
        'title': '预约转账',
        'image': 'bg_yyzz',
      });
    }
    if(index == 1){
      //定活互转
    }
    if(index == 2){
      //境外外汇汇款
      Get.toNamed(Routes.subpage1Page,);
    }
    if(index == 3){
      //他行转入
    }
    if(index == 4){
      //批量转账
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '批量转账',
        'image': 'bg_plzz',
        'navColor':const Color(0xff3C6DD3),
        'titleColor':Colors.white,
        'changeTitleColor':Colors.white
      });
    }
    if(index == 5){
      //AA收款
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': 'AA收款',
        'image': 'ic_aask',
        'navColor':const Color(0xff3C6DD3),
        'titleColor':Colors.white
      });
    }
    if(index == 6){
      //公益捐款
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': '公益捐款',
        'image': 'bg_gyjk',
      });
    }
    if(index == 7){
      //撤销转账
      Get.toNamed(Routes.subpage2Page,);
    }
    if(index == 8){
      //境内外币转账
      '该付款庄户无外币子账户，请向前往柜台开通'.dialog(showCancel: false);
    }
    if(index == 9){
      //消费贷款转存
      '该账户中并无快贷专用资金，请您先支用一笔快贷。\n参考码:NHO001.YCEP1MBS1114'.dialog(showCancel: false);

    }
    if(index == 10){
      //向支付机构
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '批量转账',
        'image': 'bg_xzfjgfk',
        'navColor':const Color(0xff3C6DD3),
        'titleColor':Colors.white,
        'changeTitleColor':Colors.white
      });
    }
  }

}
