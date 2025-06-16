import 'package:ccb/config/balance_config/balance_eye_widget.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';


import '../detail_search_list_logic.dart';
import '../detail_search_list_state.dart';
import 'new_picker_header.dart';

class DateTimePicker extends StatefulWidget {
  final DateTime? initialDateTime;
  final ValueChanged<DateTime>? onDateTimeChanged;
  final NewSearchPickerHeaderNotifier? headerNotifier;
  const DateTimePicker({
    super.key,
    this.initialDateTime,
    this.onDateTimeChanged,
    this.headerNotifier,
  });

  @override
  _DateTimePickerState createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  late FixedExtentScrollController _yearController;
  late FixedExtentScrollController _monthController;
  late FixedExtentScrollController _dayController;

  late int _selectedYear;
  late int _selectedMonth;
  late int _selectedDay;

  final DateTime _currentDate = DateTime.now();
  final int _startYear = 2015;


  final DetailSearchListLogic logic = Get.put(DetailSearchListLogic());
  final DetailSearchListState state = Get.find<DetailSearchListLogic>().state;

  @override
  void initState() {
    super.initState();


    final initialDate = widget.initialDateTime ?? _currentDate;
    _selectedYear = initialDate.year;
    _selectedMonth = initialDate.month;
    _selectedDay = initialDate.day;

    _yearController =
        FixedExtentScrollController(initialItem: _selectedYear - _startYear);
    _monthController =
        FixedExtentScrollController(initialItem: _selectedMonth - 1);
    _dayController = FixedExtentScrollController(initialItem: _selectedDay - 1);

    widget.headerNotifier?.addListener(_onController);

  }
  _onController() {
    if (mounted) {
      if (widget.headerNotifier?.type == "jumpTime") {
        jumpToDate(widget.headerNotifier?.jTime??DateTime.now());
      }
    }
  }


  void jumpToDate(DateTime date) {
    final years = getYears();
    final yearIndex = years.indexOf(date.year);
    if (yearIndex != -1) {
      _yearController.jumpToItem(yearIndex);
      _selectedYear = date.year;
    }

    final months = getMonths();
    final monthIndex = months.indexOf(date.month);
    if (monthIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _monthController.jumpToItem(monthIndex);
      });
      _selectedMonth = date.month;
    }

    final days = getDays();
    final dayIndex = days.indexOf(date.day);
    if (dayIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dayController.jumpToItem(dayIndex);
      });
      _selectedDay = date.day;
    }

    _notifyDateTimeChanged();
  }

  @override
  void dispose() {
    _yearController.dispose();
    _monthController.dispose();
    _dayController.dispose();
    super.dispose();
  }

  List<int> getYears() {
    return List.generate(
        _currentDate.year - _startYear + 1, (index) => _startYear + index);
  }

  List<int> getMonths() {
    int maxMonth = 12;
    if (_selectedYear == _currentDate.year) {
      maxMonth = _currentDate.month;
    }
    return List.generate(maxMonth, (index) => index + 1);
  }

  List<int> getDays() {
    int maxDay;
    if (_selectedYear == _currentDate.year &&
        _selectedMonth == _currentDate.month) {
      maxDay = _currentDate.day;
    } else {
      maxDay = DateTime(_selectedYear, _selectedMonth + 1, 0).day;
    }
    return List.generate(maxDay, (index) => index + 1);
  }

  void _onYearSelected(int index) {
    final years = getYears();
    setState(() {
      _selectedYear = years[index];
      // 检查月份是否超出范围
      final months = getMonths();
      if (_selectedMonth > months.length) {
        _selectedMonth = months.last;
        _monthController.jumpToItem(_selectedMonth - 1);
      }
      // 检查日期是否超出范围
      final days = getDays();
      if (_selectedDay > days.length) {
        _selectedDay = days.last;
        _dayController.jumpToItem(_selectedDay - 1);
      }
    });
    _notifyDateTimeChanged();
  }

  void _onMonthSelected(int index) {
    setState(() {
      _selectedMonth = index + 1;
      // 检查日期是否超出范围
      final days = getDays();
      if (_selectedDay > days.length) {
        _selectedDay = days.last;
        _dayController.jumpToItem(_selectedDay - 1);
      }
    });
    _notifyDateTimeChanged();
  }

  void _onDaySelected(int index) {
    setState(() {
      _selectedDay = index + 1;
    });
    _notifyDateTimeChanged();
  }

  void _notifyDateTimeChanged() {
    if (widget.onDateTimeChanged != null) {
      widget.onDateTimeChanged!(
          DateTime(_selectedYear, _selectedMonth, _selectedDay));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CupertinoPicker(
            scrollController: _yearController,
            itemExtent: 32,
            onSelectedItemChanged: _onYearSelected,
            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
              capStartEdge: false,
              capEndEdge: false,
            ),
            children: getYears().map((year) {
              return Center(
                child: Text(
                  '$year年',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        // 月选择器
        Expanded(
          child: CupertinoPicker(
            scrollController: _monthController,
            itemExtent: 32,
            onSelectedItemChanged: _onMonthSelected,
            selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
              capStartEdge: false,
              capEndEdge: false,
            ),
            children: getMonths().map((month) {
              return Center(
                child: Text(
                  '$month月',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        // 日选择器
       GetBuilder(builder: (DetailSearchListLogic c) {
         return logic.state.isDay? Expanded(
           child: CupertinoPicker(
             scrollController: _dayController,
             itemExtent: 32,
             onSelectedItemChanged: _onDaySelected,
             selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
               capStartEdge: false,
               capEndEdge: false,
             ),
             children: getDays().map((day) {
               return Center(
                 child: Text(
                   '$day日',
                   style: TextStyle(
                     fontSize: 15,
                     color: Colors.black,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
               );
             }).toList(),
           ),
         ):SizedBox.shrink();
       },id: 'updateM',),
      ],
    ).withPadding(
      left: 12.w,
      right: 12.w,
    );
  }
}
