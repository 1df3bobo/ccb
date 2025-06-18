import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class HomeHoseWidget extends StatefulWidget {
  const HomeHoseWidget({super.key});

  @override
  State<HomeHoseWidget> createState() => _HomeHoseWidgetState();
}

class _HomeHoseWidgetState extends State<HomeHoseWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.w, right: 0.w),
      child: _containerBg(
        width: 350.w,
        height: 425.w,
        imagePath: 'bg_home_hose',
        // child: Expanded(
        //   child: Container(
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           height: 130.w,
        //         ),
        //         Container(
        //           width: 1.sw,
        //           height: 80.w,
        //           child: Row(
        //             children: [
        //               Expanded(
        //                   child: Container(
        //                 color: Colors.red.withOpacity(0.2),
        //               )),
        //               Expanded(
        //                   child: Container(
        //                 color: Colors.yellow.withOpacity(0.2),
        //               )),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
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
