import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../utils/scale_point_widget.dart';
import 'fixed_nav_logic.dart';
import 'fixed_nav_state.dart';

class FixedNavPage extends BaseStateless {
  FixedNavPage({Key? key}) : super(key: key,title: Get.arguments?['title']??'无title参数');

  final FixedNavLogic logic = Get.put(FixedNavLogic());
  final FixedNavState state = Get.find<FixedNavLogic>().state;

  @override
  Color? get navColor => Get.arguments?['navColor']??Colors.white;

  @override
  Color? get titleColor => Get.arguments?['titleColor']??Colors.black;

  @override
  Color? get background =>  Get.arguments?['background'];

  @override
  Color? get backColor => Get.arguments?['backColor']??Get.arguments?['titleColor']??Colors.black;

  @override
  List<Widget>? get rightAction => [

    ScalePointWidget(
      icColor: Get.arguments?['titleColor']??Colors.black,
    ).withPadding(right: 6.w),

    Icon(
      Icons.clear,
      color: Get.arguments?['titleColor']??Colors.black,
    ).withOnTap(onTap: () {
      Get.back();
    }).withPadding(
      right: 16.w,
    )
  ];
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
