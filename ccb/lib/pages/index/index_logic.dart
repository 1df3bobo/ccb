import 'package:ccb/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../utils/local_notifications.dart';
import 'index_state.dart';

class IndexLogic extends GetxController {
  final IndexState state = IndexState();

  /// 默认选择第一个页面
  var taBarIdx = 0.obs;



  @override
  void onClose() {
    super.onClose();
    NotificationHelper.getInstance().closeSubject();
  }

  @override
  void onInit() {
    super.onInit();
    NotificationHelper.getInstance().initPermission();
    AppConfig.config.balanceLogic.memberInfoData();
    state.item = state.appBarList.map((data) {
      return BottomNavigationBarItem(
        icon: Obx(() => Image(
              image:
                  '${data["icon"]}${taBarIdx.value == data["index"] ? '_select${taBarIdx.value}' : '_normal${data["index"]}'}'
                      .png3x,
              width: 22.w,
              height: 22.w,
            )),
        label: data["title"],
      );
    }).toList();
  }

  /// navigationBar设置
  Widget navigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      onTap: selectIndex,
      currentIndex: taBarIdx.value,
      selectedFontSize: 13.sp,
      unselectedFontSize: 13.sp,
      unselectedItemColor: Colors.black,
      selectedItemColor: Color(state.appBarList[taBarIdx.value]['selectColor']),
      type: BottomNavigationBarType.fixed,
      items: state.item,
    );
  }

  void selectIndex(int index) {
    if (taBarIdx.value == index) return;
    // if (index == 4) {
    //   FaceUtil.localAuth().then((v){
    //     if(v == true){
    //       Get.to(
    //             () => FacePage(),
    //         fullscreenDialog: true,
    //       )?.then((v) {
    //         if (v == '1') {
    //           taBarIdx.value = index;
    //         }
    //       });
    //     }else{
    //       taBarIdx.value = index;
    //     }
    //   });
    //   return;
    // }
    taBarIdx.value = index;
  }
}
