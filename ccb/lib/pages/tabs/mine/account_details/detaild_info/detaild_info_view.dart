import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../utils/scale_point_widget.dart';
import '../../../../index/index_logic.dart';
import 'detaild_info_logic.dart';
import 'detaild_info_state.dart';

class DetailInfoPage extends BaseStateless {
  DetailInfoPage({Key? key}) : super(key: key, title: '明细详情');

  final DetailInfoLogic logic = Get.put(DetailInfoLogic());
  final DetailInfoState state = Get.find<DetailInfoLogic>().state;


  void jumpPage(String name){
    SmartDialog.dismiss();
    if(name == '建行客服'){
      Get.toNamed(Routes.ccbCustomerPage,);
    }
    if(name == '首页'){
      Get.offAllNamed(Routes.tabs);
      final IndexLogic logic = Get.put(IndexLogic());
      logic.selectIndex(0);
    }
    if(name == '消息'){
      Get.toNamed(Routes.mineMessagePage,);
    }

  }

  @override
  List<Widget>? get rightAction => [
    Image(
      image: 'ic_mx_search'.png3x,
      width: 18.w,
      height: 18.w,
    ).withOnTap(onTap: () {
      Get.offNamed(Routes.detailSearchPage);
    }).withPadding(
      right: 20.w,
    ),
    ScalePointWidget(
      left:110.w,
      dx: 60.w,
      width: 130.w,
      content:   ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            Map<String,dynamic> data = state.rightDataList[index];
            return Row(
              children: [
                Image(
                  image: data['icon'].toString().png3x,
                  width: 16.w,
                  height: 16.w,
                  color: Colors.black,
                ).withPadding(
                  left: 4.w,
                  right: 10.w,
                ),
                BaseText(
                  text: data['name'],
                  color: Colors.black,
                )
              ],
            ).withContainer(
                padding: EdgeInsets.all(10.w),
                height: 40.w, alignment: Alignment.centerLeft).withOnTap(onTap: (){
              jumpPage(data['name']);
            });
          },
          separatorBuilder: (context, index) {
            return Container(
              width: 1.sw,
              height: 0.5.w,
              color: const Color(0xffdedede),
            );
          },
          itemCount: state.rightDataList.length),
    ).withPadding(right: 16.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return GetBuilder(
      builder: (DetailInfoLogic c) {
        return ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              color: Colors.white,
              height: 120.w,
              margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BaseText(
                    text: state.infoModel1.excerpt,
                    fontSize: 16.sp,
                    color: Color(0xff333333),
                  ),

                  SizedBox(height: 12.w,),

                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: logic.type(),
                          style: TextStyle(
                            fontSize: 28.sp,
                              color: Colors.black,
                            height: 1
                          )),
                      TextSpan(
                          text: " ¥",
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1
                          )),
                      TextSpan(
                          text: state.infoModel1.amount.bankBalance.replaceAll('-', ''),
                          style: TextStyle(
                              fontSize: 28.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              height: 1
                          )),
                    ]),
                  )
                  // BaseText(
                  //   text:
                  //       '${logic.type()} ¥ ${state.infoModel.amount.bankBalance.replaceAll('-', '')}',
                  //   fontSize: 35.sp,
                  // ),
                ],
              ),
            ),
            ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        constraints: BoxConstraints(
                          minHeight: 45.w,
                        ),
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(text: state.nameLis[index],
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                color: Color(0Xffbfbfbf),fontSize: 14.sp,
                              ),
                            ),
                            BaseText(
                              text: logic.valueName(state.nameLis[index]),
                              maxLines: 10,
                              textAlign: TextAlign.right,
                            ).withSizedBox(width: 200.w)
                          ],
                        ),
                      );
                    },
                    itemCount: state.nameLis.length)
                .withContainer(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 12.w, right: 12.w)),
          ],
        );
      },
      id: 'updateUI',
    );
  }
}
