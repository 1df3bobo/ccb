import 'package:ccb/config/app_config.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../../../data/model/bill_list_model.dart';
import '../../../../data/model/member_info_entity.dart';
import 'Req_data1.dart';
import 'component/details_picker/picker_header.dart';
import 'component/new_picker/new_picker_header.dart';

class AccountDetailsState {


  List rightDataList = [
    {
      'name':'流水打印',
      'icon':'iic_lsdy_',
    },
    {
      'name':'建行客服',
      'icon':'ic_home_customer',
    },
    {
      'name':'首页',
      'icon':'tabbar_normal0',
    },
    {
      'name':'消息',
      'icon':'ic_home_message',
    },
  ];


  ReqData1 reqData1 = ReqData1();
  RefreshController refreshController = RefreshController();

  PickerHeaderNotifier headerNotifier = PickerHeaderNotifier();
  NewPickerHeaderNotifier newHeaderNotifier = NewPickerHeaderNotifier();


  List<BillListList> list = [];

  String incomeTotal = '--';
  String expensesTotal = '--';

  bool isDay = true;

  bool isSelectB = true;

  String beginTime1 = '';
  List<int> selectBeginList1 = [];

  String temBeginTime1 = '';
  List<int> temSelectBeginList1 = [];

  String endTime1 = '';
  List<int> selectEndList1 = [];

  String temEndTime1 = '';
  List<int> temSelectEndList1 = [];

  String monthTime1 = '';
  List<int> selectMonthList1 = [];

  String temMonthTime1 = '';
  List<int> temSelectMonthList1 = [];

  DateTime currentDate = DateTime.now();
  late DateTime lastMonthDate;
  List<int> lastThreeYears = [];
  late int currentYear;



  List selList = [];
  List handleSelList = [];
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String type = '';
  String transactionType = '';
  String transactionMethod = '';

  String orderSort = '1';



  MemberInfoModel infoModel = MemberInfoModel();

  ScrollController controller = ScrollController();


  AccountDetailsState() {

    infoModel = AppConfig.config.balanceLogic.memberInfo;
    restData();
    if (monthTime1 == '') {
      monthTime1 = "${currentDate.year}年${currentDate.month.toString().padLeft(2, '0')}月";
      print(monthTime1);
    }
  }

  void restData(){
    lastMonthDate =
        DateTime(currentDate.year, currentDate.month - 1, currentDate.day);
    if (currentDate.month == 1) {
      lastMonthDate = DateTime(currentDate.year - 1, 12, currentDate.day);
    }
    currentYear = currentDate.year; // 当前年份
    lastThreeYears = [currentYear - 2, currentYear - 1, currentYear];

    // 获取当前日期
    if (selectEndList1.isEmpty) {
      selectEndList1 = [
        lastThreeYears.indexOf(lastMonthDate.year),
        currentDate.month - 1,
        currentDate.day - 1,
      ];
    }

    if (selectBeginList1.isEmpty) {
      selectBeginList1 = [
        lastThreeYears.indexOf(currentDate.year),
        lastMonthDate.month - 1,
        lastMonthDate.day - 1,
      ];
    }

    if (selectMonthList1.isEmpty) {
      selectMonthList1 = [
        lastThreeYears.indexOf(currentDate.year),
        currentDate.month - 1,
        currentDate.day - 1,
      ];
    }

    if (beginTime1 == '') {
      beginTime1 = "${lastMonthDate.year}年${lastMonthDate.month.toString().padLeft(2, '0')}月${lastMonthDate.day.toString().padLeft(2, '0')}日";
    }

    if (endTime1 == '') {
      endTime1 ="${currentDate.year}年${currentDate.month.toString().padLeft(2, '0')}月${currentDate.day.toString().padLeft(2, '0')}日";
    }

  }

  List<String> getMonthStartEnd() {
    if (isDay) {
      return [
        beginTime1.timeDrop1.replaceAll('.', '-'),
        endTime1.timeDrop1.replaceAll('.', '-'),
      ];
    } else {
      try {
        // 解析输入字符串
        final parts = monthTime1.timeDrop2.split('.');
        if (parts.length != 2) throw const FormatException('格式应为YYYY.MM');

        final year = int.parse(parts[0]);
        final month = int.parse(parts[1]);

        // 验证月份有效性
        if (month < 1 || month > 12) {
          throw FormatException('月份必须在1-12之间');
        }

        // 计算月初（当月第一天）
        final firstDay = DateTime(year, month, 1);

        // 计算月末（下个月第一天减去1天）
        final nextMonth = month == 12
            ? DateTime(year + 1, 1, 1)
            : DateTime(year, month + 1, 1);
        final lastDay = nextMonth.subtract(const Duration(days: 1));

        return [
          DateUtil.formatDate(firstDay, format: DateFormats.y_mo_d),
          DateUtil.formatDate(lastDay, format: DateFormats.y_mo_d),
        ];
      } catch (e) {
        throw FormatException('无效的日期格式: ${monthTime1.timeDrop2}');
      }
    }
  }
}
