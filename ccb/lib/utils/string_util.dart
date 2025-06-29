import 'package:ccb/config/app_config.dart';

/// 格式化手机号码为 "188 8888 8888" 格式
String formatPhoneNumber(String phone) {
  if (phone.length != 11) return phone;
  return '${phone.substring(0, 3)} ${phone.substring(3, 7)} ${phone.substring(7)}';
}

/// 格式化银行卡信息，包含银行名称和卡号
String formatBankCard(int index) {
  if (AppConfig.config.balanceLogic.memberInfo.bankList.isEmpty || 
      index >= AppConfig.config.balanceLogic.memberInfo.bankList.length) return '';
      
  final bankInfo = AppConfig.config.balanceLogic.memberInfo.bankList[index];
  if (bankInfo.bankName.isEmpty || bankInfo.bankCard.isEmpty) return '';
  
  final cardNumber = bankInfo.bankCard;
  if (cardNumber.length < 8) return '';
  
  String firstFour = cardNumber.substring(0, 4);
  String lastFour = cardNumber.substring(cardNumber.length - 4);
  return '${bankInfo.bankName}   $firstFour***$lastFour';
}

/// 格式化银行卡信息，包含银行名称和卡号
String getBankInfo() {
  if (AppConfig.config.balanceLogic.memberInfo.bankList.isEmpty) return '';
  final bankInfo = AppConfig.config.balanceLogic.memberInfo.bankList[0];
  if (bankInfo.bankName.isEmpty || bankInfo.bankCard.isEmpty) return '';
  return '${bankInfo.bankName}   ${formatBankCard(0)}';
} 