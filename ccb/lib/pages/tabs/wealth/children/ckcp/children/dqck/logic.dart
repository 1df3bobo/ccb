import 'package:get/get.dart';

import 'state.dart';

class DqckLogic extends GetxController {
  final DqckState state = DqckState();
  
  final selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // 选择tab
  void selectTab(int index) {
    selectedIndex.value = index;
  }

  // 立即存入按钮点击
  void onDepositClick() {
    Get.snackbar('提示', '立即存入功能开发中');
  }

  // 分享按钮点击
  void onShareClick() {
    Get.snackbar('提示', '分享功能开发中');
  }

  // 帮助按钮点击
  void onHelpClick() {
    Get.snackbar('提示', '帮助功能开发中');
  }
} 