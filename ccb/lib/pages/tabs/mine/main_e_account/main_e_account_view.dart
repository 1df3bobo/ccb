import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'main_e_account_logic.dart';
import 'main_e_account_state.dart';

class MainEAccountPage extends BaseStateless {
  MainEAccountPage({Key? key}) : super(key: key,title: 'e账户开户');

  final MainEAccountLogic logic = Get.put(MainEAccountLogic());
  final MainEAccountState state = Get.find<MainEAccountLogic>().state;

  @override
  Color? get navColor => const Color(0xff3C6DD3);

  @override
  Color? get titleColor => Colors.white;

  @override
  Color? get backColor => Colors.white;


  @override
  Widget initBody(BuildContext context) {
    final navHeight =
        MediaQuery.of(context).padding.top + AppBar().preferredSize.height;
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [

        Stack(
          children: [
            Obx(() => Container(
              width: 1.sw,
              height:1.sh ,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:logic.showFirst.value?'e_zh1'.png3x:'e_zh2'.png3x,
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Container(height: 45.w,).withOnTap(onTap: (){
                        logic.showFirst.value = true;
                      })),
                      Expanded(child: Container(height: 45.w,).withOnTap(onTap: (){
                        logic.showFirst.value = false;
                      })),
                    ],
                  ),

                ],
              ),
            )),
          ],
        ),
      ],
    );
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    Widget? child,
  }) {
    return Container(
      width: width,
      height:height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imagePath.png3x,
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
