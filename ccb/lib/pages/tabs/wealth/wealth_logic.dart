import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/dio/network.dart';
import '../../../config/net_config/apis.dart';
import '../../../data/model/account_view_model.dart';
import 'wealth_state.dart';

class WealthLogic extends GetxController {
  final WealthState state = WealthState();

  // 添加一个新的变量来管理眼睛图标的状态
  final isEyeOpen = true.obs;
  final reloadShow = true.obs;
  void toggleEyeState() {
    isEyeOpen.value = !isEyeOpen.value;
    reloadShow.value = isEyeOpen.value;
  }

  void accountView() async{
    await Http.get(Apis.accountView,queryParameters: {
      'type':'0'
    }).then((value) {
      if (value is Map<String, dynamic>) {
        state.accountViewModel = AccountViewModel.fromJson(value);
        update(['updateUI']);
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    accountView();
  }
}
