import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import '../../index/index_view.dart';
import 'login_logic.dart';
import 'login_state.dart';

class LoginPage extends BaseStateless {
  LoginPage({super.key});

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  bool get isChangeNav => true;

  // @override
  // bool get isShowAppbar => false;

  @override
  double? get lefItemWidth => 30.w;

  // @override
  // Widget? get leftItem => SizedBox(
  //     width: 10.w,
  //     height: 10.w,
  //     child: GestureDetector(
  //       onTap: () {
  //         Get.back();
  //       },
  //       child: Image(width: 20.w, height: 20.w, image: ('login_back').png3x),
  //     ));

  @override
  Widget initBody(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Stack(children: [
            Positioned(
              top: 51.w + ScreenUtil().statusBarHeight,
              left: 1.sw / 2 - 58.w / 2,
              child: Image(
                  width: 58.w,
                  height: 58.w,
                  image: ('login_head_holder').png3x),
            ),
            Positioned(
                top: 55.5.w,
                right: 0,
                child: Image(
                    width: 128.w,
                    height: 128.w,
                    image: ('login_head_bg').png3x)),
            Positioned(
                top: 180.w,
                left: 1.sw / 2 - 58.w / 2,
                child: Text("上午好！",
                    style:
                        TextStyle(fontSize: 18.sp, color: Color(0xff666666)))),
            Positioned(
              top: 300.5.w, // 调整垂直位置
              left: 20.w, // 调整水平位置
              right: 20.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: state.phoneTextController,
                    decoration: InputDecoration(
                      border: InputBorder.none, // 隐藏边框
                      hintText: '请输入手机号',
                      hintStyle: TextStyle(
                        color: Color(0xff999999), // 设置提示文字颜色
                        fontSize: 16.0, // 可选：调整字体大小
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                  Divider(
                    color: Color(0x668C8C8C),
                    height: 1,
                    thickness: 1,
                  ),

                  SizedBox(
                    height: 15.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          controller: state.psdTextController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none, // 隐藏边框
                            hintText: '请输入密码',
                            hintStyle: TextStyle(
                              color: Color(0xff999999), // 设置提示文字颜色
                              fontSize: 16.0, // 可选：调整字体大小
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // 处理忘记密码点击事件
                          print('点击了忘记密码');
                        },
                        child: Text(
                          '忘记密码',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Color(0x668C8C8C),
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(height: 40.w), // 调整下划线与输入框之间的间距
                  // 添加登录按钮
                  SizedBox(
                    width: double.infinity, // 使按钮宽度和下划线一样长
                    height: 50.w,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation:WidgetStateProperty.all(0),
                      ),
                      onPressed: () {
                        // 处理登录点击事件
                        print('点击了登录按钮');
                        logic.goLogin();
                      },
                      child: Text('登录'),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 15.w)),
                  SizedBox(
                      width: double.infinity, // 使按钮宽度和下划线一样长
                      height: 20.w,
                      child: Text(
                        textAlign: TextAlign.center,
                        "更多选项｜帮助",
                        style: TextStyle(color: Colors.blue, fontSize: 16.sp),
                      )), // 调整按钮与其他内容之间的间距
                ],
              ),
            ),
          ])),
    );
  }
}
