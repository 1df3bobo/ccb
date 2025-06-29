// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:ccb/data/model/account_view_model.dart';
import 'package:ccb/data/model/apply_list_model.dart';
import 'package:ccb/data/model/bank_data_model.dart';
import 'package:ccb/data/model/bill_info_model.dart';
import 'package:ccb/data/model/bill_list_model.dart';
import 'package:ccb/data/model/contacts_list_model.dart';
import 'package:ccb/data/model/flow_list_model.dart';
import 'package:ccb/data/model/member_info_entity.dart';
import 'package:ccb/data/model/month_bill_model.dart';
import 'package:ccb/data/model/transfer_info_model.dart';
import 'package:ccb/data/model/transfer_record_model.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);
extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        var covertFunc = convertFuncMap[type]!;
        if (covertFunc is Map<String, dynamic>) {
          return covertFunc(value as Map<String, dynamic>) as T;
        } else {
          return covertFunc(Map<String, dynamic>.from(value)) as T;
        }
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<AccountViewModel>[] is M) {
      return data.map<AccountViewModel>((Map<String, dynamic> e) =>
          AccountViewModel.fromJson(e)).toList() as M;
    }
    if (<AccountViewChartList>[] is M) {
      return data.map<AccountViewChartList>((Map<String, dynamic> e) =>
          AccountViewChartList.fromJson(e)).toList() as M;
    }
    if (<ApplyListModel>[] is M) {
      return data.map<ApplyListModel>((Map<String, dynamic> e) =>
          ApplyListModel.fromJson(e)).toList() as M;
    }
    if (<ApplyListList>[] is M) {
      return data.map<ApplyListList>((Map<String, dynamic> e) =>
          ApplyListList.fromJson(e)).toList() as M;
    }
    if (<BankDataModel>[] is M) {
      return data.map<BankDataModel>((Map<String, dynamic> e) =>
          BankDataModel.fromJson(e)).toList() as M;
    }
    if (<BankDataBankList>[] is M) {
      return data.map<BankDataBankList>((Map<String, dynamic> e) =>
          BankDataBankList.fromJson(e)).toList() as M;
    }
    if (<BankDataHotList>[] is M) {
      return data.map<BankDataHotList>((Map<String, dynamic> e) =>
          BankDataHotList.fromJson(e)).toList() as M;
    }
    if (<BillInfoModel>[] is M) {
      return data.map<BillInfoModel>((Map<String, dynamic> e) =>
          BillInfoModel.fromJson(e)).toList() as M;
    }
    if (<BillListModel>[] is M) {
      return data.map<BillListModel>((Map<String, dynamic> e) =>
          BillListModel.fromJson(e)).toList() as M;
    }
    if (<BillListList>[] is M) {
      return data.map<BillListList>((Map<String, dynamic> e) =>
          BillListList.fromJson(e)).toList() as M;
    }
    if (<ContactsListModel>[] is M) {
      return data.map<ContactsListModel>((Map<String, dynamic> e) =>
          ContactsListModel.fromJson(e)).toList() as M;
    }
    if (<FlowListModel>[] is M) {
      return data.map<FlowListModel>((Map<String, dynamic> e) =>
          FlowListModel.fromJson(e)).toList() as M;
    }
    if (<FlowListList>[] is M) {
      return data.map<FlowListList>((Map<String, dynamic> e) =>
          FlowListList.fromJson(e)).toList() as M;
    }
    if (<MemberInfoModel>[] is M) {
      return data.map<MemberInfoModel>((Map<String, dynamic> e) =>
          MemberInfoModel.fromJson(e)).toList() as M;
    }
    if (<MemberInfoBankList>[] is M) {
      return data.map<MemberInfoBankList>((Map<String, dynamic> e) =>
          MemberInfoBankList.fromJson(e)).toList() as M;
    }
    if (<MonthBillModel>[] is M) {
      return data.map<MonthBillModel>((Map<String, dynamic> e) =>
          MonthBillModel.fromJson(e)).toList() as M;
    }
    if (<MonthBillIncome>[] is M) {
      return data.map<MonthBillIncome>((Map<String, dynamic> e) =>
          MonthBillIncome.fromJson(e)).toList() as M;
    }
    if (<MonthBillIncomeTrend>[] is M) {
      return data.map<MonthBillIncomeTrend>((Map<String, dynamic> e) =>
          MonthBillIncomeTrend.fromJson(e)).toList() as M;
    }
    if (<MonthBillIncomeCategory>[] is M) {
      return data.map<MonthBillIncomeCategory>((Map<String, dynamic> e) =>
          MonthBillIncomeCategory.fromJson(e)).toList() as M;
    }
    if (<MonthBillIncomeCategoryChartList>[] is M) {
      return data.map<MonthBillIncomeCategoryChartList>((
          Map<String, dynamic> e) =>
          MonthBillIncomeCategoryChartList.fromJson(e)).toList() as M;
    }
    if (<MonthBillAppUsageRate>[] is M) {
      return data.map<MonthBillAppUsageRate>((Map<String, dynamic> e) =>
          MonthBillAppUsageRate.fromJson(e)).toList() as M;
    }
    if (<MonthBillExpenses>[] is M) {
      return data.map<MonthBillExpenses>((Map<String, dynamic> e) =>
          MonthBillExpenses.fromJson(e)).toList() as M;
    }
    if (<MonthBillExpensesTrend>[] is M) {
      return data.map<MonthBillExpensesTrend>((Map<String, dynamic> e) =>
          MonthBillExpensesTrend.fromJson(e)).toList() as M;
    }
    if (<MonthBillExpensesCategory>[] is M) {
      return data.map<MonthBillExpensesCategory>((Map<String, dynamic> e) =>
          MonthBillExpensesCategory.fromJson(e)).toList() as M;
    }
    if (<MonthBillExpensesCategoryChartList>[] is M) {
      return data.map<MonthBillExpensesCategoryChartList>((
          Map<String, dynamic> e) =>
          MonthBillExpensesCategoryChartList.fromJson(e)).toList() as M;
    }
    if (<TransferInfoModel>[] is M) {
      return data.map<TransferInfoModel>((Map<String, dynamic> e) =>
          TransferInfoModel.fromJson(e)).toList() as M;
    }
    if (<TransferRecordModel>[] is M) {
      return data.map<TransferRecordModel>((Map<String, dynamic> e) =>
          TransferRecordModel.fromJson(e)).toList() as M;
    }
    if (<TransferRecordList>[] is M) {
      return data.map<TransferRecordList>((Map<String, dynamic> e) =>
          TransferRecordList.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (AccountViewModel).toString(): AccountViewModel.fromJson,
    (AccountViewChartList).toString(): AccountViewChartList.fromJson,
    (ApplyListModel).toString(): ApplyListModel.fromJson,
    (ApplyListList).toString(): ApplyListList.fromJson,
    (BankDataModel).toString(): BankDataModel.fromJson,
    (BankDataBankList).toString(): BankDataBankList.fromJson,
    (BankDataHotList).toString(): BankDataHotList.fromJson,
    (BillInfoModel).toString(): BillInfoModel.fromJson,
    (BillListModel).toString(): BillListModel.fromJson,
    (BillListList).toString(): BillListList.fromJson,
    (ContactsListModel).toString(): ContactsListModel.fromJson,
    (FlowListModel).toString(): FlowListModel.fromJson,
    (FlowListList).toString(): FlowListList.fromJson,
    (MemberInfoModel).toString(): MemberInfoModel.fromJson,
    (MemberInfoBankList).toString(): MemberInfoBankList.fromJson,
    (MonthBillModel).toString(): MonthBillModel.fromJson,
    (MonthBillIncome).toString(): MonthBillIncome.fromJson,
    (MonthBillIncomeTrend).toString(): MonthBillIncomeTrend.fromJson,
    (MonthBillIncomeCategory).toString(): MonthBillIncomeCategory.fromJson,
    (MonthBillIncomeCategoryChartList)
        .toString(): MonthBillIncomeCategoryChartList.fromJson,
    (MonthBillAppUsageRate).toString(): MonthBillAppUsageRate.fromJson,
    (MonthBillExpenses).toString(): MonthBillExpenses.fromJson,
    (MonthBillExpensesTrend).toString(): MonthBillExpensesTrend.fromJson,
    (MonthBillExpensesCategory).toString(): MonthBillExpensesCategory.fromJson,
    (MonthBillExpensesCategoryChartList)
        .toString(): MonthBillExpensesCategoryChartList.fromJson,
    (TransferInfoModel).toString(): TransferInfoModel.fromJson,
    (TransferRecordModel).toString(): TransferRecordModel.fromJson,
    (TransferRecordList).toString(): TransferRecordList.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}