import 'package:ccb/utils/scale_point_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'more_group_section.dart';
import 'more_logic.dart';
import 'more_state.dart';

class MorePage extends BaseStateless {
  MorePage({super.key});

  final MoreLogic logic = Get.put(MoreLogic());
  final MoreState state = MoreState();

  @override
  bool get isChangeNav => false;

  @override
  String get navTitle => '';

  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset('assets/new_images/back.png', width: 12.w, height: 16.w),
    onPressed: () => Get.back(),
  );

  @override
  bool get isShowNav => true;

  @override
  bool get isShowLeading => false;

  @override
  Widget? get titleWidget => _buildTitle();

  @override
  double? get lefItemWidth => 50.w;



  @override
  List<Widget>? get rightAction => [
    const ScalePointWidget(
      icColor: Colors.black,
    ).withPadding(right: 30.w, left: 10),
  ];

  Widget _buildTitle() {
    return Row(
      children: [
        SizedBox(width: 12.w),
         Expanded(
          child: PlaceholderSearchWidget(
            contentList: ['请输入功能名称进行查询'],
            bgColor: Color.fromRGBO(255, 255, 255, 0.66),
            border: Border.all(color: Color(0xFF999999), width: 1),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 我的应用标题和定制按钮
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('我的应用',
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600)),
                const SizedBox(width: 15,),
                Expanded(
                  child: Obx(() => Row(
                    children: List.generate(logic.appList.length, (index) {
                      final item = logic.appList[index];
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Column(
                          children: [
                            Image.asset(
                              item['icon']!,
                              width: 17.w,
                              height: 17.w,
                            ),
                          ],
                        ),
                      );
                    }),
                  )),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF28409A)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('定制', style: TextStyle(color: Color(0xFF28409A), fontSize: 13)),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.w),
          // 应用图标横向列表
          const MoreGroupSection(),
        ],
      ),
    );
  }
}
