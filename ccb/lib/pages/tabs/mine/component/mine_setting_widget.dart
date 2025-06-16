import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../routes/app_pages.dart';

class MineSettingWidget extends StatefulWidget {
  const MineSettingWidget({super.key});

  @override
  State<MineSettingWidget> createState() => _MineSettingWidgetState();
}

class _MineSettingWidgetState extends State<MineSettingWidget> {
  @override
  Widget build(BuildContext context) {
    return _containerBg(
        width: 350.w,
        height: 136.w,
        imagePath: 'bg_mine_setting',
        child: Row(children: [
          Expanded(child: Container().withOnTap(onTap: (){
            Get.toNamed(Routes.minePeizhiPage,arguments: {
              'title':'面容',
              'image':'bg_mine_mr',
            });
          })),
          Expanded(child: Container().withOnTap(onTap: (){
            Get.toNamed(Routes.minePeizhiPage,arguments: {
              'title':'限额设置',
              'image':'bg_mine_xe',
            });
          })),
          Expanded(child: Container().withOnTap(onTap: (){
            Get.toNamed(Routes.minePeizhiPage,arguments: {
              'title':'修改手机号码',
              'image':'bg_mine_xg',
            });
          })),
          Expanded(child: Container().withOnTap(onTap: (){

          })),
        ],).withContainer(
          margin: EdgeInsets.only(left: 20.w,right: 20.w,top: 55.w,bottom: 18.w)
        ));
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF6FCFF).withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
