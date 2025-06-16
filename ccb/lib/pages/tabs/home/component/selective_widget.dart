import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

class SelectiveWidget extends StatefulWidget {
  const SelectiveWidget({super.key});

  @override
  State<SelectiveWidget> createState() => _SelectiveWidgetState();
}

class _SelectiveWidgetState extends State<SelectiveWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(left: 12.w,right: 12.w,top: 15.w),
      child: Container(
        width: 350.w,
        height: 292.w,
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
            image: 'bg_home_selective'.png3x,
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(left: 16.w,top: 16.w,bottom: 16.w),
              child: BaseText(
                text: "财富精选",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                ),
              ),
            ),

            Row(
              children: [
                Padding(padding: EdgeInsets.only(
                  left: 16.w,
                ),child: _containerBg(
                  width: 160.w,
                  height: 175.w,
                  imagePath: 'ic_home_selective_1',
                ),),

                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.w,bottom: 5.w),
                      child:  _containerBg(
                        width: 160.w,
                        height: 85.w,
                        imagePath: 'ic_home_selective_2',
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 10.w),
                      child: _containerBg(
                        width: 160.w,
                        height: 85.w,
                        fit: BoxFit.fitWidth,
                        imagePath: 'ic_home_selective_3',
                      ),
                    ),

                  ],
                )
              ],
            ),

            Padding(padding: EdgeInsets.only(left: 30.w,right: 30.w,top: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  _tagWidget('ic_selective_tag_1', '财富体检'),
                  Container(
                    width: 0.5.w,
                    height: 10.w,
                    color: const Color(0xff707070),
                  ),
                  _tagWidget('ic_selective_tag_2', '财富体检'),
                  Container(
                    width: 0.5.w,
                    height: 10.w,
                    color: const Color(0xff707070),
                  ),
                  _tagWidget('ic_selective_tag_3', '财富体检'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget _tagWidget(String path,String name){

    return Row(
      children: [
        Image(image: path.png3x,width: 17.w,height: 17.w,),
        BaseText(text: name,fontSize: 13.sp,)
      ],
    );
  }


  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
}){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
