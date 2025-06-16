import 'package:ccb/generated/json/base/json_convert_content.dart';
import 'package:ccb/data/model/member_info_entity.dart';

MemberInfoModel $MemberInfoModelFromJson(Map<String, dynamic> json) {
  final MemberInfoModel memberInfoModel = MemberInfoModel();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    memberInfoModel.id = id;
  }
  final String? bankId = jsonConvert.convert<String>(json['bankId']);
  if (bankId != null) {
    memberInfoModel.bankId = bankId;
  }
  final String? realName = jsonConvert.convert<String>(json['realName']);
  if (realName != null) {
    memberInfoModel.realName = realName;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    memberInfoModel.accountBalance = accountBalance;
  }
  final String? appAccount = jsonConvert.convert<String>(json['appAccount']);
  if (appAccount != null) {
    memberInfoModel.appAccount = appAccount;
  }
  final String? idCard = jsonConvert.convert<String>(json['idCard']);
  if (idCard != null) {
    memberInfoModel.idCard = idCard;
  }
  final String? chapterCode = jsonConvert.convert<String>(json['chapterCode']);
  if (chapterCode != null) {
    memberInfoModel.chapterCode = chapterCode;
  }
  final String? sex = jsonConvert.convert<String>(json['sex']);
  if (sex != null) {
    memberInfoModel.sex = sex;
  }
  final String? city = jsonConvert.convert<String>(json['city']);
  if (city != null) {
    memberInfoModel.city = city;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    memberInfoModel.phone = phone;
  }
  final String? account = jsonConvert.convert<String>(json['account']);
  if (account != null) {
    memberInfoModel.account = account;
  }
  final String? serialNumber = jsonConvert.convert<String>(
      json['serialNumber']);
  if (serialNumber != null) {
    memberInfoModel.serialNumber = serialNumber;
  }
  final String? certificateBeginTime = jsonConvert.convert<String>(
      json['certificateBeginTime']);
  if (certificateBeginTime != null) {
    memberInfoModel.certificateBeginTime = certificateBeginTime;
  }
  final String? certificateEndTime = jsonConvert.convert<String>(
      json['certificateEndTime']);
  if (certificateEndTime != null) {
    memberInfoModel.certificateEndTime = certificateEndTime;
  }
  final String? loginTime = jsonConvert.convert<String>(json['loginTime']);
  if (loginTime != null) {
    memberInfoModel.loginTime = loginTime;
  }
  final String? payStatus = jsonConvert.convert<String>(json['payStatus']);
  if (payStatus != null) {
    memberInfoModel.payStatus = payStatus;
  }
  final List<MemberInfoBankList>? bankList = (json['bankList'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<MemberInfoBankList>(e) as MemberInfoBankList)
      .toList();
  if (bankList != null) {
    memberInfoModel.bankList = bankList;
  }
  final String? starRating = jsonConvert.convert<String>(json['starRating']);
  if (starRating != null) {
    memberInfoModel.starRating = starRating;
  }
  final String? points = jsonConvert.convert<String>(json['points']);
  if (points != null) {
    memberInfoModel.points = points;
  }
  final String? couponsNum = jsonConvert.convert<String>(json['couponsNum']);
  if (couponsNum != null) {
    memberInfoModel.couponsNum = couponsNum;
  }
  final String? credit = jsonConvert.convert<String>(json['credit']);
  if (credit != null) {
    memberInfoModel.credit = credit;
  }
  return memberInfoModel;
}

Map<String, dynamic> $MemberInfoModelToJson(MemberInfoModel entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['bankId'] = entity.bankId;
  data['realName'] = entity.realName;
  data['accountBalance'] = entity.accountBalance;
  data['appAccount'] = entity.appAccount;
  data['idCard'] = entity.idCard;
  data['chapterCode'] = entity.chapterCode;
  data['sex'] = entity.sex;
  data['city'] = entity.city;
  data['phone'] = entity.phone;
  data['account'] = entity.account;
  data['serialNumber'] = entity.serialNumber;
  data['certificateBeginTime'] = entity.certificateBeginTime;
  data['certificateEndTime'] = entity.certificateEndTime;
  data['loginTime'] = entity.loginTime;
  data['payStatus'] = entity.payStatus;
  data['bankList'] = entity.bankList.map((v) => v.toJson()).toList();
  data['starRating'] = entity.starRating;
  data['points'] = entity.points;
  data['couponsNum'] = entity.couponsNum;
  data['credit'] = entity.credit;
  return data;
}

extension MemberInfoModelExtension on MemberInfoModel {
  MemberInfoModel copyWith({
    int? id,
    String? bankId,
    String? realName,
    double? accountBalance,
    String? appAccount,
    String? idCard,
    String? chapterCode,
    String? sex,
    String? city,
    String? phone,
    String? account,
    String? serialNumber,
    String? certificateBeginTime,
    String? certificateEndTime,
    String? loginTime,
    String? payStatus,
    List<MemberInfoBankList>? bankList,
    String? starRating,
    String? points,
    String? couponsNum,
    String? credit,
  }) {
    return MemberInfoModel()
      ..id = id ?? this.id
      ..bankId = bankId ?? this.bankId
      ..realName = realName ?? this.realName
      ..accountBalance = accountBalance ?? this.accountBalance
      ..appAccount = appAccount ?? this.appAccount
      ..idCard = idCard ?? this.idCard
      ..chapterCode = chapterCode ?? this.chapterCode
      ..sex = sex ?? this.sex
      ..city = city ?? this.city
      ..phone = phone ?? this.phone
      ..account = account ?? this.account
      ..serialNumber = serialNumber ?? this.serialNumber
      ..certificateBeginTime = certificateBeginTime ?? this.certificateBeginTime
      ..certificateEndTime = certificateEndTime ?? this.certificateEndTime
      ..loginTime = loginTime ?? this.loginTime
      ..payStatus = payStatus ?? this.payStatus
      ..bankList = bankList ?? this.bankList
      ..starRating = starRating ?? this.starRating
      ..points = points ?? this.points
      ..couponsNum = couponsNum ?? this.couponsNum
      ..credit = credit ?? this.credit;
  }
}

MemberInfoBankList $MemberInfoBankListFromJson(Map<String, dynamic> json) {
  final MemberInfoBankList memberInfoBankList = MemberInfoBankList();
  final String? bankCard = jsonConvert.convert<String>(json['bankCard']);
  if (bankCard != null) {
    memberInfoBankList.bankCard = bankCard;
  }
  final String? realName = jsonConvert.convert<String>(json['realName']);
  if (realName != null) {
    memberInfoBankList.realName = realName;
  }
  final double? accountBalance = jsonConvert.convert<double>(
      json['accountBalance']);
  if (accountBalance != null) {
    memberInfoBankList.accountBalance = accountBalance;
  }
  final String? bankName = jsonConvert.convert<String>(json['bankName']);
  if (bankName != null) {
    memberInfoBankList.bankName = bankName;
  }
  final String? openOutlets = jsonConvert.convert<String>(json['openOutlets']);
  if (openOutlets != null) {
    memberInfoBankList.openOutlets = openOutlets;
  }
  final String? openTime = jsonConvert.convert<String>(json['openTime']);
  if (openTime != null) {
    memberInfoBankList.openTime = openTime;
  }
  final String? cardType = jsonConvert.convert<String>(json['cardType']);
  if (cardType != null) {
    memberInfoBankList.cardType = cardType;
  }
  final String? starRating = jsonConvert.convert<String>(json['starRating']);
  if (starRating != null) {
    memberInfoBankList.starRating = starRating;
  }
  final String? branchBelongs = jsonConvert.convert<String>(
      json['branchBelongs']);
  if (branchBelongs != null) {
    memberInfoBankList.branchBelongs = branchBelongs;
  }
  return memberInfoBankList;
}

Map<String, dynamic> $MemberInfoBankListToJson(MemberInfoBankList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['bankCard'] = entity.bankCard;
  data['realName'] = entity.realName;
  data['accountBalance'] = entity.accountBalance;
  data['bankName'] = entity.bankName;
  data['openOutlets'] = entity.openOutlets;
  data['openTime'] = entity.openTime;
  data['cardType'] = entity.cardType;
  data['starRating'] = entity.starRating;
  data['branchBelongs'] = entity.branchBelongs;
  return data;
}

extension MemberInfoBankListExtension on MemberInfoBankList {
  MemberInfoBankList copyWith({
    String? bankCard,
    String? realName,
    double? accountBalance,
    String? bankName,
    String? openOutlets,
    String? openTime,
    String? cardType,
    String? starRating,
    String? branchBelongs,
  }) {
    return MemberInfoBankList()
      ..bankCard = bankCard ?? this.bankCard
      ..realName = realName ?? this.realName
      ..accountBalance = accountBalance ?? this.accountBalance
      ..bankName = bankName ?? this.bankName
      ..openOutlets = openOutlets ?? this.openOutlets
      ..openTime = openTime ?? this.openTime
      ..cardType = cardType ?? this.cardType
      ..starRating = starRating ?? this.starRating
      ..branchBelongs = branchBelongs ?? this.branchBelongs;
  }
}