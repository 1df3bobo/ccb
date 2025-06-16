import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

typedef PickerSelectedCallback = void Function(
    Picker picker, int index, List<int> selected);

typedef PickerConfirmCallback = void Function(
    Picker picker, List<int> selected);

class AlterPickerTime {
  static showDataPick(BuildContext context, {
    required List dataList,
    String title = '请选择',
    Function? onConfirm,
  }) async {
    BoxBorder border = const Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 0.1,
      ),
    );

    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(pickerData: dataList),
        changeToFirst: false,
        textAlign: TextAlign.left,
        height: 150.w + ScreenUtil().bottomBarHeight,
        selectedTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
              bottom:
              BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
            ),
          ),
        ),
        itemExtent: 45.w,
        headerDecoration: BoxDecoration(border: border),
        title: BaseText(text: title),
        cancelText: '取消',
        confirmText: '确认',
        cancelTextStyle: TextStyle(color: Colors.grey, fontSize: 14.w),
        confirmTextStyle: TextStyle(color: Colors.blue, fontSize: 14.w),
        onConfirm: (Picker picker, List value) {
          onConfirm?.call(picker.getSelectedValues());
        });
    picker.showBottomSheet(context);
  }

  static showTime(BuildContext context, {
    String title = '时间选择',
    PickerSelectedCallback? onSelect,
    PickerConfirmCallback? onConfirm,
    List<int>? selecteds,
    final bool hideHeader = false,
    final Widget? footer,
    final int? yearBegin,
    yearEnd,
  }) {
    BoxBorder border = Border(
      bottom: BorderSide(
        color: Colors.grey,
        width: 0.1,
      ),
    );
    DateTime now = DateTime.now();
    DateTimePickerAdapter adapter = DateTimePickerAdapter(
      yearBegin: yearBegin ?? 2015,
      yearEnd: yearEnd ?? now.year,
      type: PickerDateTimeType.kYMD,
      isNumberMonth: true,
      yearSuffix: "年",
      monthSuffix: "月",
      daySuffix: "日",
    );
    var picker = Picker(
        backgroundColor: Colors.white,
        selecteds: selecteds,
        height: 200.w + ScreenUtil().bottomBarHeight,
        selectedTextStyle: TextStyle(fontSize: 16.sp, color: Colors.black),
        hideHeader:hideHeader,
        footer:footer,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
              bottom:
              BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
            ),
          ),
        ),
        itemExtent: 45.w,
        headerDecoration: BoxDecoration(border: border),
        adapter: adapter,
        title: BaseText(text: title),
        cancelText: '取消',
        confirmText: '确认',

        cancelTextStyle: TextStyle(color: Colors.grey, fontSize: 14.w),
        confirmTextStyle: TextStyle(color: Colors.blue, fontSize: 14.w),
        onConfirm: onConfirm,
        onSelect: onSelect);
    picker.showModal(context, builder: (context, view) {
      return Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.w),
                  topRight: Radius.circular(10.w))),
          child: view);
    });
  }

}
