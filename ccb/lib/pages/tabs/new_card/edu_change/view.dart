import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import 'logic.dart';
import 'state.dart';

class EduChangePage extends BaseStateless {
  EduChangePage({Key? key}) : super(key: key);

  final EduChangeLogic logic = Get.put(EduChangeLogic());
  final EduChangeState state = Get.find<EduChangeLogic>().state;

  @override
  AppBar? get appBar => AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Image.asset(
            'assets/new_images/back.png',
            width: 8.w,
            height: 16.w,
            color: Colors.white,
          ),
        ),
        title: const Text('信用卡', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF3C6DD3),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.white),
            onPressed: () {
              // Handle more button tap
            },
          )
        ],
      );

  @override
  String get title => '信用卡';

  @override
  Color? get navTitleColor => Colors.white;

  @override
  Color? get leadingColor => Colors.white;

  @override
  Color get navColor => const Color(0xFF3C6DD3);

  @override
  List<Widget>? get rightAction => [
    IconButton(
      icon: const Icon(Icons.more_horiz, color: Colors.white),
      onPressed: () {
        // Handle more button tap
      },
    )
  ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xFFF3F3F3),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildSegment1(),
            Image.asset(
              'assets/new_images/card/edu_change/segment_2.png',
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegment1() {
    return SizedBox(
      height: 160.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/new_images/card/edu_change/segment_1.png',
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.only(left: 80.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '您暂无我行有效信用卡',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 20.h),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF3C6DD3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      side: const BorderSide(color: Color(0xFF3C6DD3)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  ),
                  child: const Text('申请办卡', style: TextStyle(fontSize: 15)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
