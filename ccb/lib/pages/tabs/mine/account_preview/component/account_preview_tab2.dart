import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../../../../../config/balance_config/balance_eye_widget.dart';
import '../../../../../config/balance_config/balance_logic.dart';
import '../../../../../data/model/member_info_entity.dart';
import '../../../../../routes/app_pages.dart';

class AccountPreviewTab2 extends StatefulWidget {
  const AccountPreviewTab2({super.key});

  @override
  State<AccountPreviewTab2> createState() => _AccountPreviewTab2State();
}

class _AccountPreviewTab2State extends State<AccountPreviewTab2> {
  List<String> cardNameList = [
    '储蓄卡',
    '信用卡',
  ];

  String cardName = '储蓄卡';

  List<String> cardFunctionList = [
    '明细',
    '',
    '转账',
    '',
    '无卡取款',
    '',
    '买理财',
  ];

  void jumpPage(String name) {
    if (name == '明细') {
      Get.toNamed(Routes.accountDetail);
    }

    if (name == '转账') {
      Get.toNamed(Routes.accountTransferPage);
    }

    if (name == '无卡取款') {
      Get.toNamed(Routes.fixedNavPage, arguments: {
        'title': 'ATM无卡取款',
        'image': 'bg_no_card',
        'background': Colors.white
      });
    }
    if (name == '买理财') {
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '理财产品',
        'image': 'bg_lccp',
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: 'bg_account_preview_top2'.png3x,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.w),
          topRight: Radius.circular(12.w),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                border: Border.all(
                  width: 0,
                  color: const Color(0xffF6F6F6),
                ),
              ),
              padding: EdgeInsets.only(top: 16.w, left: 8.w),
              child: Row(
                children: cardNameList.map((e) {
                  return Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10.w, right: 10.w, top: 6.w, bottom: 6.w),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: cardName == e
                            ? const Color(0xffE5ECF6)
                            : Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      ),
                      child: BaseText(
                        text: e,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                        color: cardName == e
                            ? const Color(0xff3C6DD3)
                            : Colors.black,
                      ),
                    ).withOnTap(onTap: () {
                      cardName = e;
                      setState(() {});
                    }),
                  );
                }).toList(),
              ),
            ),
            if (cardName == '储蓄卡') ...card1(),
            if (cardName == '信用卡') ...card2(),
          ],
        ),
      ),
    );
  }

  List<Widget> card1() {
    return [
      ListView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          MemberInfoBankList infoModel =
              AppConfig.config.balanceLogic.memberInfo.bankList[index];
          return Container(
            height: 192.w,
            width: 350.w,
            color: const Color(0xffF6F6F6),
            child: Container(
              width: 350.w,
              height: 180.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.w),
              ),
              margin: EdgeInsets.only(left: 12.w, right: 12.w, top: 12.w),
              child: Column(
                children: [
                  Expanded(child: cardInfo(infoModel)),
                  Container(
                    height: 42.w,
                    width: 350.w,
                    padding: EdgeInsets.only(left: 12.w, right: 12.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: cardFunctionList.map((e) {
                        if (e == '') {
                          return Container(
                            color: Color(0xffF3F1F1),
                            height: 30.w,
                            width: 1.w,
                          );
                        }
                        return BaseText(
                          text: e,
                          fontSize: 14.sp,
                          color: Color(0xff626364),
                        ).withOnTap(onTap: () {
                          jumpPage(e);
                        });
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: AppConfig.config.balanceLogic.memberInfo.bankList.length,
      ),
      _containerBg(
        width: 350.w,
        height: 180.w,
        imagePath: 'bg_zh_card1',
      ).withContainer(
        color: const Color(0xFFF2F2F5),
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 10.w,
        ),
      ).withOnTap(onTap: (){
        Get.toNamed(Routes.mainEAccountPage,);
      }),
      _containerBg(
        width: 350.w,
        height: 180.w,
        imagePath: 'bg_zh_card2',
      ).withContainer(
        color: const Color(0xFFF2F2F5),
        padding: EdgeInsets.only(
          left: 12.w,
          right: 12.w,
          top: 10.w,
        ),
      ).withOnTap(onTap: (){
        Get.toNamed(Routes.changeNavPage, arguments: {
          'title': '个人养老金',
          'image': 'bg_grylj',
        });
      }),
      _containerBg(
        width: 350.w,
        height: 180.w,
        imagePath: 'bg_zh_card3',
      ).withContainer(
        color: const Color(0xFFF2F2F5),
        padding: EdgeInsets.only(
          top: 10.w,
        ),
      ),
      Container(
        height: 44.w,
        width: 1.sw,
        color: Colors.white,
      )
    ];
  }

  List<Widget> card2() {
    return [
      Container(
        color: const Color(0xFFF2F2F5),
        padding: EdgeInsets.only(top: 14.w, left: 12.w, right: 12.w),
        child: _containerBg(
          width: 350.w,
          height: 180.w,
          imagePath: 'ic_xyk_sq',
        ),
      ),
    ];
  }

  Future<void> copyToClipboard(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    '复制成功'.showToast;
  }

  Widget cardInfo(MemberInfoBankList infoModel) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'bg_my_card'.png3x,
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: 'ic_jsyh'.png3x,
            width: 44.w,
            height: 44.w,
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GetBuilder(builder: (BalanceLogic c){
                    return BaseText(
                      text:c.cardInfo(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    );
                  },id: 'updateUI',),
                  BaseText(
                    text: '查看卡号',
                    fontSize: 12.sp,
                    color: const Color(0xff5489F0),
                  ).withOnTap(onTap: () {
                    SmartDialog.show(
                      usePenetrate: false,
                      clickMaskDismiss: false,
                      builder: (_) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                width: 1.sw * 0.88,
                                constraints: BoxConstraints(minHeight: 100.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                   topRight:  Radius.circular(8.w),
                                   topLeft:  Radius.circular(8.w),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 24.w,),
                                    BaseText(
                                      text: infoModel.bankCard,
                                      fontSize: 14.sp,
                                    ),
                                    SizedBox(height: 10.w,),
                                    BaseText(
                                      text: '中国建设银行股份有限公司${infoModel.openOutlets}',
                                      maxLines: 5,
                                      fontSize: 14.sp,
                                      textAlign: TextAlign.center,
                                    ).withPadding(
                                      left: 24.w,right: 24.w,
                                    ),
                                    SizedBox(height: 24.w,),
                                  ],
                                )),
                            Container(
                              width: 1.sw * 0.88,
                              height: 0.5.w,
                              color: const Color(0xffbbbbab),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight:  Radius.circular(8.w),
                                  bottomLeft:  Radius.circular(8.w),
                                ),
                              ),
                              height: 42.w,
                              width: 1.sw * 0.88,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: ( const BaseText(
                                          text: '复制全部',
                                          color: Colors.blueAccent,
                                        )),
                                      ).withOnTap(onTap: () {
                                        copyToClipboard('${infoModel.bankCard} ${infoModel.branchBelongs}');
                                        SmartDialog.dismiss();
                                      })),
                                  Container(
                                    width: 0.5.w,
                                    height: 42.w,
                                    color: const Color(0xffbbbbab),
                                  ),
                                  Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: (const BaseText(
                                          text: '仅复制卡号',
                                          color: Colors.blueAccent,
                                        )),
                                      ).withOnTap(onTap: () {
                                        copyToClipboard(infoModel.bankCard);
                                        SmartDialog.dismiss();
                                      })),
                                ],
                              ),
                            ),
                            Image(image: 'ic_updata_close'.png3x,width: 24.w,height: 24.w,).withOnTap(onTap: (){
                              SmartDialog.dismiss();
                            }).withPadding(top: 25.w),
                          ],
                        );
                      },
                    );
                  })
                ],
              ),
              SizedBox(height: 4.w),
            Row(
              children: [
                BaseText(
                  text: "龙卡通",
                  color: Color(0xff9A9C9F),
                  fontSize: 12.sp,
                ),
                SizedBox(width: 8.w,),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xff5489F0).withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(2.w))
                  ),
                  width: 22.w,height: 12.w,
                  child: BaseText(text: '正常',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff5489F0),
                        // height: 1,
                        fontSize: 9.sp
                    ),),
                ),
              ],
            ),
              SizedBox(height: 18.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          BaseText(
                            text: "可用余额(元)",
                            color: Color(0xff9A9C9F),
                            fontSize: 12.sp,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          BalanceEyeWidget(
                            openEye: 'ic_zhanghu',
                            closeEye: 'ic_zhanghu2',
                            width: 18.w,
                            height: 18.w,
                          )
                        ],
                      ),
                      SizedBox(height: 8.w),
                      GetBuilder(builder: (BalanceLogic c) {
                       return BalanceWidget(
                          child: BaseText(
                            text: NumberFormat().format(c.memberInfo.accountBalance),
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 24),
                          ),
                        );
                      },id: 'updateBalance',),
                    ],
                  ),
                  Container(
                    width: 65.w,
                    height: 28.w,
                  ).withOnTap(onTap: () {
                    Get.toNamed(
                      Routes.cardDetailPage,
                    );
                  })
                ],
              ).withContainer(width: 280.w)
            ],
          )
        ],
      ).withPadding(
        left: 12.w,
        top: 12.w,
      ),
    );
  }

  Widget _containerBg({
    required double width,
    required double height,
    required String imagePath,
    BoxFit fit = BoxFit.fill,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffF6FCFF).withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
        image: DecorationImage(
          image: imagePath.png3x,
          fit: fit,
        ),
      ),
      child: child,
    );
  }
}
