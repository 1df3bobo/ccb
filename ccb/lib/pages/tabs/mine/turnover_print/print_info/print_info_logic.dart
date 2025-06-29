import 'dart:math';

import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../../utils/local_notifications.dart';
import 'print_info_state.dart';

class PrintInfoLogic extends GetxController {
  final PrintInfoState state = PrintInfoState();


  @override
  void onInit() {
    super.onInit();

    state.printData = Get.arguments['info'];

    Map<String, dynamic> data = state.printData.toJson();

    Future.delayed(const Duration(milliseconds: 1500),(){
      state.downBtnController.click();

      NotificationHelper.getInstance().showNotification(
          title: "106980095533",
          body: "您申请的手机银行短信验证码为${Random().nextVerificationCode(6)}，口令有效期为5分钟", payload: "payload");
    });

    data.forEach((k,v){
      state.keyList.add(state.titleMap[k]);
      state.valueList.add(v);
    });
    state.keyList.add('服务人员代码');
    state.keyList.add('服务机构代码');

    state.valueList.add('textField');
    state.valueList.add('textField');
  }

}
