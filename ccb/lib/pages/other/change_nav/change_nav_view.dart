import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../utils/scale_point_widget.dart';
import 'change_nav_logic.dart';
import 'change_nav_state.dart';

class ChangeNavPage extends BaseStateless {
  ChangeNavPage({super.key})
      : super(title: Get.arguments?['title'] ?? '无title参数');

  final ChangeNavLogic logic = Get.put(ChangeNavLogic());
  final ChangeNavState state = Get.find<ChangeNavLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get navColor => Get.arguments?['navColor'] ?? Colors.white;

  @override
  List<Widget>? get rightAction => _rightItem();


  List<Widget> _rightItem(){
    if(Get.arguments?['rightItem']  == '0') return [];
    if(Get.arguments?['rightItem']  == '1'){

      return [
        Obx(
              () => ScalePointWidget(
            icColor: logic.navActionColor.value,
                left: 80.w,
                dx: 40.w,
                dy: 10.w,
          ).withPadding(right: 20.w),
        ),
      ];
    }

    return [
      Obx(
            () => ScalePointWidget(
          icColor: logic.navActionColor.value,
        ).withPadding(right: 6.w),
      ),
      Obx(() => Icon(
        Icons.clear,
        color: logic.navActionColor.value,
      ).withOnTap(onTap: () {
        Get.back();
      }).withPadding(
        right: 16.w,
      ))
    ];
  }

  @override
  Widget? get leftItem => InkWell(
        child: Obx(() => Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Icon(
                Icons.navigate_before,
                size: 30.h,
                color: logic.navActionColor.value,
              ),
            )),
        onTap: () => Get.back(),
      );

  @override
  Widget? get titleWidget => Obx(
        () => BaseText(
            text: title ?? '',
            fontSize: 18.sp,
            color: logic.navActionColor.value),
      );

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v
            ? Get.arguments['changeTitleColor'] ?? Colors.black
            : Get.arguments['defTitleColor'] ?? Colors.white;
      };

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        if (logic.state.assetsImagePath != '')
          Image(
            image: logic.state.assetsImagePath.png3x,
            fit: BoxFit.fitWidth,
            width: 1.sw,
          )
      ],
    );
  }
}
