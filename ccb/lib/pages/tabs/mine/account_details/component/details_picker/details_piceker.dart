import 'package:ccb/pages/tabs/mine/account_details/component/details_picker/picker_foot.dart';
import 'package:ccb/pages/tabs/mine/account_details/component/details_picker/picker_header.dart';
import 'package:ccb/pages/tabs/mine/account_details/component/new_picker/new_picker_foot.dart';
import 'package:ccb/pages/tabs/mine/account_details/component/new_picker/new_picker_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker_plus/picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../new_picker/new_picker_date.dart';

class DetailsPicker {
  static showHeadTime(
    BuildContext context, {
    String title = '时间选择',
    PickerSelectedCallback? onSelect,
    PickerConfirmCallback? onConfirm,
    List<int>? selecteds,
    int? yearBegin,
    yearEnd,
    PickerHeaderNotifier? headerNotifier,
  }) {
    DateTime now = DateTime.now();

    DateTimePickerAdapter adapter = DateTimePickerAdapter(
      yearBegin: yearBegin ?? now.year - 2,
      yearEnd: yearEnd ?? now.year,
      type: PickerDateTimeType.kYMD,
      isNumberMonth: true,
      yearSuffix: "年",
      monthSuffix: "月",
      daySuffix: "日",
    );
    Picker picker;
    picker = Picker(
        backgroundColor: Colors.white,
        selecteds: selecteds,
        height: 160.w + ScreenUtil().bottomBarHeight,
        selectedTextStyle: TextStyle(
            fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
        textStyle: TextStyle(
            fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.bold),
        selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
          capStartEdge: false,
          capEndEdge: false,
        ),
        // selectionOverlay: Container(
        //   decoration: BoxDecoration(
        // color: Color(0xffdedede).withOpacity(0.4),
        // border: Border(
        //   top: BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)),
        //   bottom:
        //   BorderSide(width: 1.w, color: const Color(0xFFE7E7E7)), // 下边框
        // ),
        //   ),
        // ),
        itemExtent: 32.w,
        hideHeader: true,
        adapter: adapter,
        cancelTextStyle: TextStyle(color: Colors.grey, fontSize: 14.w),
        confirmTextStyle: TextStyle(color: Colors.blue, fontSize: 14.w),
        onSelect: (Picker picker, int index, List<int> selected) {
          print(selected);
          headerNotifier?.upDataTime(picker.adapter.toString(), selected);
        });
    picker.showModal(context, builder: (context, view) {
      return Container(
        height: 200.w + 80.w + 85.w + ScreenUtil().bottomBarHeight,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PickerHeader(
              callBack: (value) {
                if (value) {
                  adapter.type = PickerDateTimeType.kYMD;
                  picker.state?.update();
                } else {
                  adapter.type = PickerDateTimeType.kYM;
                  picker.state?.update();
                }
              },
              picker: picker,
              controller: headerNotifier,
              adapter: adapter,
            ),
            Container(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: view,
            ),
            const PickerFoot(),
          ],
        ),
      );
    });
  }

  static showNewTime({
    NewPickerHeaderNotifier? newHeadNotifier,
}) {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return Container(
          height: 200.w + 80.w + 85.w + ScreenUtil().bottomBarHeight + 60.w,
          color: Colors.white,
          child: Column(
            children: [
              NewPickerHeader(
                headerNotifier: newHeadNotifier,
              ),
              // 时间选择器
              Expanded(
                child: DateTimePicker(
                  headerNotifier: newHeadNotifier,
                  onDateTimeChanged: (DateTime newDate) {
                    newHeadNotifier?.upDataTime(newDate);
                  },
                ),
              ),

              const NewPickerFoot(),
            ],
          ),
        );
      },
    );
  }
}
