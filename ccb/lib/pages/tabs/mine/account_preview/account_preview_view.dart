import 'package:ccb/pages/tabs/mine/account_preview/component/account_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import 'account_preview_logic.dart';
import 'account_preview_state.dart';

class AccountPreviewPage extends BaseStateless {

  AccountPreviewPage({super.key}) : super(title: "账户总览",);

  final AccountPreviewLogic logic = Get.put(AccountPreviewLogic());
  final AccountPreviewState state = Get.find<AccountPreviewLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Color? get backColor => Colors.white;

  @override
  bool get noBackGround1 => false;

  @override
  Color? get background => const Color(0xffF6F6F6);

  @override
  Widget initBody(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        const AccountTopWidget()
      ],
    );
  }
}
