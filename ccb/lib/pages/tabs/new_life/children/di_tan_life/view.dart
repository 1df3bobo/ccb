import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';
import 'logic.dart';

class DiTanLifePage extends BaseStateless {
  final logic = Get.put(DiTanLifeLogic());

  DiTanLifePage({super.key});

  @override
  String? get title => '低碳生活';

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
    IconButton(
      icon: Image.asset('assets/new_images/close.png', width: 14.w, height: 14.w),
      onPressed: () => Get.back(),
    ),
    SizedBox(width: 8.w),
  ];

  @override
  Widget initBody(BuildContext context) {
    return SingleChildScrollView(
      child: Image.asset(
        'assets/new_images/life/children/di_tan_life.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
} 