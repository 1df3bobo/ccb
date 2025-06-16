import 'package:ccb/config/dio/network.dart';
import 'package:ccb/config/net_config/apis.dart';
import 'package:ccb/utils/sp_util.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';

import '../../data/model/member_info_entity.dart';

class BalanceLogic extends GetxController {
  var showValue = false.obs;

  MemberInfoModel memberInfo = MemberInfoModel();

  @override
  void onInit() {
    super.onInit();
    // memberInfoData();
  }

  Future memberInfoData() async {
    if (token == '') return;
    await Http.post(Apis.memberInfo).then((value) {
      if (value is Map<String, dynamic>) {
        memberInfo = MemberInfoModel.fromJson(value);
        update(['updateBalance','updateUI','updateCard']);
      }
    });
  }

  void showBalance({
    bool show = false,
  }) {
    showValue.value = show;
    update(['updateBalance', 'updateEyeBalance']);
  }

  String balance() {
    var formatter = NumberFormat();
    var formattedNumber = formatter.format(memberInfo.accountBalance);
    return formattedNumber;
  }

  String cardInfo(){
    if(memberInfo.bankList.isNotEmpty){
      return '${memberInfo.bankList.first.bankName}（${memberInfo.bankList.first.bankCard.getLastFourByList()}）';
    }
    return '--';
  }

  String card(){
    if(memberInfo.bankList.isNotEmpty){
      return memberInfo.bankList.first.bankCard.maskBankCardNumber();
    }
    return '--';
  }
}
