import 'package:ccb/data/model/transfer_info_model.dart';

class TransferDetailState {


  List nameLis = [
    '交易时间',
    '交易类型',
    '交易渠道',
    '付款账户',
    '凭证号',
  ];

  Map<String,dynamic> argMap = {};

  TransferInfoModel infoModel = TransferInfoModel();

  TransferDetailState() {
    ///Initialize variables
  }
}
