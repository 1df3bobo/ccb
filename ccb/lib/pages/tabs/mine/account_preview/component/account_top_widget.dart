import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/tab_indicator.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_preview_logic.dart';
import 'account_preview_tab1.dart';
import 'account_preview_tab2.dart';

class AccountTopWidget extends StatefulWidget {
  const AccountTopWidget({super.key});

  @override
  State<AccountTopWidget> createState() => _AccountTopWidgetState();
}

class _AccountTopWidgetState extends State<AccountTopWidget> {

  final AccountPreviewLogic logic = Get.put(AccountPreviewLogic());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          height: 90.w + ScreenUtil().statusBarHeight,
          width: 1.sw,
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 4.w),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: 'bg_account_preview_top1'.png3x,
              fit: BoxFit.fill,
            ),
          ),
          child: orderTabBarBottom(),
        ),

        SizedBox(
          height: 1.sh - ScreenUtil().statusBarHeight - 90.w,
          width: 1.sw,
          child: tabContent(),
        ),

      ],
    );
  }

  Widget orderTabBarBottom() {
    return TabBar(
      controller: logic.state.tabController,
      labelColor: Colors.white,
      unselectedLabelColor: const Color(0xff839CE0),
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      indicator: TabIndicator(color:Colors.white,indHeight: 4.h),
      tabs: logic.state.tabNameList.map((name) {
        return BaseText(text: name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp),);
      }).toList(),
    ).withContainer(
      color: Colors.transparent,
      height: 40.h,
      width: 1.sw,
    );
  }

  ///* tabBar内容******/
  Widget tabContent() {
    return TabBarView(
      controller: logic.state.tabController,
      children: const [
        AccountPreviewTab1(),
        AccountPreviewTab2(),
      ],
    );
  }

}
