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
    return _containerBg(
      width: 375.w,
      height: 284.w,
      imagePath: 'bg_home_hose',
      child: Container(
          padding: EdgeInsets.only(top: 100.w, bottom: 15.w,left: 15.w,right: 15.w,),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: Colors.blue.withOpacity(0.2),
                    ).withOnTap(onTap: () {
                      // Get.toNamed(Routes.fixedNavPage, arguments: {
                      //   'title': '主会场',
                      //   'image': 'cfhd_1',
                      // });
                    })),
                    Expanded(
                        child: Container(
                      color: Colors.red.withOpacity(0.2),
                    ).withOnTap(onTap: () {
                      // Get.toNamed(Routes.changeNavPage, arguments: {
                      //   'title': '',
                      //   'image': 'honme_hsq',
                      // });
                    },),),
                  ],
                ),
              ),
              Container(
                width: 1.sw,
                height: 65.w,
                color: Colors.purpleAccent.withOpacity(0.2),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red.withOpacity(0.2),
                      ).withOnTap(onTap: () {
                        // Get.toNamed(Routes.changeNavPage, arguments: {
                        //   'title': '',
                        //   'image': 'honme_hsq',
                        // });
                      },),),

                    Expanded(
                      child: Container(
                        color: Colors.yellow.withOpacity(0.2),
                      ).withOnTap(onTap: () {
                        // Get.toNamed(Routes.changeNavPage, arguments: {
                        //   'title': '',
                        //   'image': 'honme_hsq',
                        // });
                      },),),

                    Expanded(
                      child: Container(
                        color: Colors.red.withOpacity(0.2),
                      ).withOnTap(onTap: () {
                        // Get.toNamed(Routes.changeNavPage, arguments: {
                        //   'title': '',
                        //   'image': 'honme_hsq',
                        // });
                      },),),
                  ],
                ),
              )
            ],
          )),
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
        color: const Color(0xffF2FBFD),
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
