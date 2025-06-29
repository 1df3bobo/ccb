import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class YueHuiBeiJingPage extends BaseStateless {
  final logic = Get.put(YueHuiBeiJingLogic());

  YueHuiBeiJingPage({super.key});

  @override
  String? get title => '约惠北京';

  @override
  Widget? get leftItem => IconButton(
    icon: Image.asset('assets/new_images/back.png', width: 8.w, height: 16.w),
    onPressed: () => Get.back(),
  );

  @override
  List<Widget>? get rightAction => [
    IconButton(
      onPressed: () {},
      icon: const Icon(Icons.more_horiz, color: Colors.black),
    ),

  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/life/children/yue_hui_bei_jing.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 