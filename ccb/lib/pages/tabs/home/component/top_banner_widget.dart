import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/grid_view_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../routes/app_pages.dart';

class TopBannerWidget extends StatefulWidget {
  const TopBannerWidget({super.key});

  @override
  State<TopBannerWidget> createState() => _TopBannerWidgetState();
}

class _TopBannerWidgetState extends State<TopBannerWidget> {
  List<String> nameList = ['账户查询', '转账汇款', '贷款', '扫一扫'];

  void jumpPage(String name){
    if(name == '账户查询'){
      Get.toNamed(Routes.accountPreview);
    }

    if(name == '转账汇款'){
      Get.toNamed(Routes.accountMoneyTransferView,);
    }

    if(name == '贷款'){
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '借钱',
        'image': 'bg_jq',
      });
    }
    if(name == '扫一扫'){
      //Get.toNamed(Routes.homeScanPage);
      Get.toNamed(Routes.saoyisaoPage);
    }
  }
  @override
  Widget build(BuildContext context) {
    return VerticalGridView(
      widgetBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: 'ic_top_tag${index + 1}'.png3x,
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(
              height: 4.w,
            ),
            BaseText(
              text: nameList[index],
              style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ).withOnTap(onTap: () => jumpPage(nameList[index]));
      },
      mainHeight: 93.w,
      itemCount: 4,
    )
        .withContainer(
          width: 350.w,
          height: 93.w,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12.w),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 0.5,
                offset: const Offset(0, 1),
              ),
            ],
          ),
        )
        .withContainer(
          width: 375.w,
          height: 300.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_home_top'.png3x,
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10.w),
        );
  }
}
