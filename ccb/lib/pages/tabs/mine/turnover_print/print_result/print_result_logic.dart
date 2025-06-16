import 'package:get/get.dart';

import 'print_result_state.dart';

class PrintResultLogic extends GetxController {
  final PrintResultState state = PrintResultState();

  @override
  void onInit() {
    super.onInit();
    state.printData = Get.arguments['info'];

    Map<String, dynamic> data = state.printData.toJson();

    data.forEach((k,v){
      state.keyList.add(state.titleMap[k]);
      state.valueList.add(v);
    });

    state.keyList.add('解压密码');
    state.valueList.add(Get.arguments['code']);
  }
}
