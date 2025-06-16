import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/rotate_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../config/balance_config/balance_logic.dart';
import '../../../../routes/app_pages.dart';
import '../../../index/index_logic.dart';

class MinePropertyWidget extends StatefulWidget {
  const MinePropertyWidget({super.key});

  @override
  State<MinePropertyWidget> createState() => _MinePropertyWidgetState();
}

class _MinePropertyWidgetState extends State<MinePropertyWidget> {
  @override
  Widget build(BuildContext context) {
    return _containerBg(
        width: 350.w,
        height: 315.w,
        imagePath: 'bg_mine_property',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          BaseText(
                            text: '我的资产',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          BalanceEyeWidget(
                            openEye: 'ic_home_eye_open',
                            closeEye: 'ic_home_eye_close',
                            width: 18.w,
                            height: 10.w,
                            appendWidget: RotatingWidget(
                              image: 'ic_home_ref'.png3x,
                            ),
                          )
                        ],
                      ),
                      BaseText(
                        text: "更多",
                        fontSize: 12.sp,
                        color: const Color(0xff666666),
                      ).withOnTap(onTap: (){
                        Get.toNamed(Routes.accountPreview);
                      }),
                    ],
                  ),
                  BaseText(
                    text: '总资产',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  ).withPadding(top: 24.w, bottom: 6.w),
                  BalanceWidget(
                    child:GetBuilder(builder: (BalanceLogic c){
                      return  RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: '¥',
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            TextSpan(
                                text: AppConfig.config.balanceLogic.balance(),
                                style: TextStyle(
                                    fontSize: 23.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ],
                        ),
                      );
                    },id: 'updateBalance',),



                  ),
                ],
              ),
            ),
            Container(
              height: 45.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Image(
                        image: 'ic_mine_xyk'.png3x,
                        width: 23.w,
                        height: 23.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      BaseText(
                        text: '信用卡',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: '办理信用卡 额度高、审批快',
                        fontSize: 13.sp,
                        color: Color(0xff666666),
                      ),
                      Image(
                        image: 'ic_zh_mx_next'.png3x,
                        width: 25.w,
                        height: 15.w,
                      )
                    ],
                  )
                ],
              ),
            ).withOnTap(onTap: (){
              final IndexLogic logic = Get.put(IndexLogic());
              logic.selectIndex(1);
            }),
            Container(
              height: 70.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Image(
                        image: 'ic_mine_dk'.png3x,
                        width: 23.w,
                        height: 23.w,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      BaseText(
                        text: '贷款',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      BaseText(
                        text: '灵活借还 快速到账\n建信福贷|由建信消费金融公司提供',
                        textAlign: TextAlign.right,
                        fontSize: 13.sp,
                        color: const Color(0xff666666),
                      ),
                      Image(
                        image: 'ic_zh_mx_next'.png3x,
                        width: 25.w,
                        height: 15.w,
                      )
                    ],
                  )
                ],
              ),
            ).withOnTap(
                onTap: () => Get.toNamed(
                      Routes.mineLoanPage,
                    )),
            Container(
              height: 40.w,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 25.w, top: 6.w),
              child: BaseText(
                  text: '闲钱转入龙钱宝，随用随取',
                  fontSize: 10.sp,
                  color: const Color(0xff666666)),
            ),
          ],
        ).withPadding(top: 25.w, left: 25.w, right: 25.w));
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
