import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/picker_widget.dart';
import 'package:wb_base_widget/component/text_field_widget.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../turnover_print_logic.dart';

class PrintItem5Widget extends StatefulWidget {
  const PrintItem5Widget({super.key});

  @override
  State<PrintItem5Widget> createState() => _PrintItem5WidgetState();
}

class _PrintItem5WidgetState extends State<PrintItem5Widget> {
  List<String> nameList1 = ['获取方式', '电子邮箱', '文件类型'];

  List modeNames = ['电子邮件'];

  List typeNames = ['PDF（带电子印章）','EXCEL'];

  final TurnoverPrintLogic logic = Get.put(TurnoverPrintLogic());

  @override
  void initState() {
    super.initState();
    logic.state.item5title1 = '电子邮件';
    logic.state.item5title2 = 'PDF（带电子印章）';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      height: 145.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      margin: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.w),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 47.w,
              child: _item(nameList1[index]),
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              height: 1.w,
              margin: EdgeInsets.only(left: 11.w, right: 11.w),
              color: const Color(0xffDDDDDD),
            );
          },
          itemCount: nameList1.length),
    );
  }

  Widget _item(String title) {
    return Row(
      children: [
        Container(
          width: 125.w,
          padding: EdgeInsets.only(left: 10.w),
          child: BaseText(
            text: title,
            fontSize: 14.sp,
            color: const Color(0xff363636),
          ),
        ),
        Expanded(child: _contentWidget(title)),
        title == '电子邮箱'
            ? const SizedBox.shrink()
            : Image(
                image: 'ic_print_next'.png3x,
                width: 25.w,
                height: 25.w,
              )
      ],
    );
  }

  Widget _contentWidget(String title){
    if(title == '电子邮箱'){
      return  TextFieldWidget(
        controller: logic.state.item5TextController,
        keyboardType: TextInputType.emailAddress,
        hintText: '请正确输入本人邮箱地址',onSubmitted: (v){
          logic.update(['updateBottom']);
      },
      );
    }
    if(title == '获取方式'){

     return BaseText(
        text: logic.state.item5title1 ,
        color: Color(0xff666666),
      ).withOnTap(onTap: () {
       AlterPickerTime.showDataPick(context, dataList: modeNames,onConfirm: (List v){
         logic.state.item5title1 = v.first;
         setState(() {});
       });
      });
    }
    if(title == '文件类型'){

      return BaseText(
        text: logic.state.item5title2 ,
        color: Color(0xff666666),
      ).withOnTap(onTap: () {
        AlterPickerTime.showDataPick(context, dataList: typeNames,onConfirm: (List v){
          logic.state.item5title2 = v.first;
          setState(() {});
        });
      });

    }
    return Container();
  }
}
