import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'bangdingshebei_logic.dart';
import 'bangdingshebei_state.dart';

class BangdingshebeiPage extends BaseStateless {
  BangdingshebeiPage({Key? key}) : super(key: key);

  final BangdingshebeiLogic logic = Get.put(BangdingshebeiLogic());
  final BangdingshebeiState state = Get.find<BangdingshebeiLogic>().state;
  @override
  bool get isChangeNav => true;

  @override
  double? get lefItemWidth => 62.w;

  @override
  Widget? get titleWidget => Text(
        "绑定设备",
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black,
        ),
      );
  @override
  Widget initBody(BuildContext context) {
    return Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().statusBarHeight + kToolbarHeight + 20.w)),
            Center(
                child: Container(
              color: Colors.white,
              height: 337.w,
              width: 331.w,
              child: Image(image: 'bg_settig_bdsb'.png3x, fit: BoxFit.fill),
            ))
          ],
        ));
  }
}
