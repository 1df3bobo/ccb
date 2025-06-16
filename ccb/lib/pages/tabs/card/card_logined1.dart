import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

import 'card_logic.dart';
import 'card_state.dart';

class Card_loginedPage1 extends StatefulWidget {
  const Card_loginedPage1({super.key});

  @override
  State<Card_loginedPage1> createState() => _Card_loginedPage1State();
}

class _Card_loginedPage1State extends State<Card_loginedPage1> {

  CarouselSliderController? _controller = CarouselSliderController();// 正确引用

  ///如果想用Get X。直接可以用父类的
  // final CardLogic logic = Get.put(CardLogic());
  // final CardState state = Get.find<CardLogic>().state;

  ///使用这个
  // Widget demo(){
  //   return GetBuilder(builder: (CardLogic c){
  //     return Container();
  //   },id: 'updateUI',);
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // 垂直居中
      crossAxisAlignment: CrossAxisAlignment.center, // 水平居中
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
            height: 349.w, // 设置轮播图的高度
             aspectRatio: 375/349, // 设置轮播图的宽高比
            viewportFraction: 1, // 当前视图占整个轮播图宽度的比例
            initialPage: 0, // 初始页面的索引
            enableInfiniteScroll: true, // 是否启用无限循环滑动
             autoPlay: true, // 是否启用自动播放
             autoPlayInterval: Duration(seconds: 5), // 自动播放的间隔时间
            // autoPlayAnimationDuration: Duration(milliseconds: 800), // 自动播放的动画持续时间
            autoPlayCurve: Curves.easeInOut, // 自动播放的动画曲线
            scrollDirection: Axis.horizontal, // 滑动方向，水平或垂直
            pauseAutoPlayOnTouch: true, // 用户触摸屏幕时是否暂停自动播放
            enlargeCenterPage: false, // 是否将中心页面放大
            onPageChanged: (index, reason) {
              // 页面切换时触发的回调函数
              print('Page changed to: $index'); // 打印当前页面的索引
            },
          ),
          items: [
            Container(
              color: Colors.red,
              child: Center(
                  child:Image(image: 'card_slider1'.png3x)
            )),
            Container(
              color: Colors.green,
              child: Center(
                  child: Center(
                      child:Image(image: 'card_slider2'.png3x)
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
