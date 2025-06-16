import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import '../../../../routes/app_pages.dart';

class MineServiceWidget extends StatefulWidget {
  const MineServiceWidget({super.key});

  @override
  State<MineServiceWidget> createState() => _MineServiceWidgetState();
}

class _MineServiceWidgetState extends State<MineServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return _containerBg(
        width: 350.w,
        height: 473.w,
        imagePath: 'bg_mine_service',
        child: Column(
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 20.w, top: 100.w),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container().withOnTap(onTap: () {
                            Get.toNamed(
                              Routes.turnoverPrintSelectPage,
                            );
                          })),
                          Expanded(
                              child: Container().withOnTap(onTap: () {
                            Get.toNamed(
                              Routes.minCreditPage,
                            );
                          })),
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container().withOnTap(onTap: () {
                            Get.toNamed(
                              Routes.mineProvePage,
                            );
                          })),
                          Expanded(child: Container().withOnTap(onTap:()=>Get.toNamed(Routes.proveApplicationPage))),
                        ],
                      )),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(left: 20.w, top: 100.w),
                  child: Column(
                    children: [
                      Expanded(
                          child: Container().withOnTap(onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '订单',
                          'navColor': Colors.white,
                          'titleColor': Colors.black,
                          'image': 'bg_order_1',
                          'background': Colors.white,
                        });
                      })),
                      Expanded(
                          child: Container().withOnTap(onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '订单',
                          'navColor': Colors.white,
                          'titleColor': Colors.black,
                          'image': 'bg_order_2',
                          'background': Colors.white,
                        });
                      })),
                      Expanded(
                          child: Container().withOnTap(onTap: () {
                        Get.toNamed(Routes.fixedNavPage, arguments: {
                          'title': '订单',
                          'navColor': Colors.white,
                          'titleColor': Colors.black,
                          'image': 'bg_order_3',
                          'background': Colors.white,
                        });
                      })),
                    ],
                  ),
                )),
              ],
            )),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: Container(
                            margin: EdgeInsets.only(left: 20.w, top: 60.w))
                        .withOnTap(onTap: () {
                  Get.toNamed(Routes.fixedNavPage, arguments: {
                    'title': '个人客户风险评估问卷 ',
                    'navColor': const Color(0xff486CCC),
                    'image': 'bg_fxpg',
                    'background': Colors.white,
                    'titleColor':  Colors.white,
                  });
                })),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20.w, top: 60.w, bottom: 30.w),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(
                              child: Container().withOnTap(
                                  onTap: () =>
                                      Get.toNamed(Routes.mineMessagePage))),
                          Expanded(child: Container().withOnTap(onTap: (){
                            Get.toNamed(Routes.changeNavPage, arguments: {
                              'title': '借钱',
                              'image': 'bg_jq',
                            });
                          }))
                        ],
                      )),
                      Expanded(
                          child: Row(
                        children: [
                          Expanded(child: Container().withOnTap(
                              onTap: () =>
                                  Get.toNamed(Routes.accountMoneyTransferView))),

                          Expanded(child: Container())
                        ],
                      )),
                    ],
                  ),
                )),
              ],
            )),
          ],
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
