import 'package:ccb/config/app_config.dart';
import 'package:ccb/config/balance_config/balance_logic.dart';
import 'package:ccb/main/my_app_page.dart';
import 'package:ccb/pages/account/login/login_logic.dart';
import 'package:ccb/pages/account/login/login_view.dart';
import 'package:ccb/pages/tabs/mine/account_preview/component/account_preview_chat_widget.dart';
import 'package:ccb/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wb_base_widget/extension/double_extension.dart';
import 'package:wb_base_widget/extension/string_extension.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';
import 'package:wb_base_widget/text_widget/bank_text.dart';

import '../account_preview_logic.dart';

class AccountPreviewTab1 extends StatefulWidget {
  const AccountPreviewTab1({super.key});

  @override
  State<AccountPreviewTab1> createState() => _AccountPreviewTab1State();
}

class _AccountPreviewTab1State extends State<AccountPreviewTab1> {
  List infoDataList = [
    {'image': 'ic_a_p_0', 'name': '账户明细'},
    {'image': 'ic_a_p_1', 'name': '转账汇款'},
    {'image': 'ic_a_p_2', 'name': '财富体检'},
  ];

  bool showInfo = false;


  void jumpPage(String name){
    if(name == '账户明细'){
      Get.toNamed(Routes.accountDetail);
    }
    if(name == '转账汇款'){
      Get.toNamed(Routes.accountMoneyTransferView);
    }
    if(name == '财富体检'){
      Get.toNamed(Routes.changeNavPage, arguments: {
        'title': '财富体检',
        'image': 'bg_cftj',
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
          children: [
            GetBuilder(builder: (AccountPreviewLogic c) {
              return Column(
                children: [
                  Container(
                    height: 172.w - 42.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: 'bg_account_preview_info1'.png3x,
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BaseText(text: '我的资产',fontSize: 17.sp,color: Colors.white,),
                            Row(
                              children: [
                                Image(image: 'ic_zc_check'.png3x,width: 20.w,height: 20.w,),
                                BaseText(text: '总负债',fontSize: 14.sp,color: Colors.white,),
                              ],
                            )
                          ],
                        ).withPadding(top: 18.w,left: 18.w,right: 18.w),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '总资产 ',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white)),
                                      TextSpan(
                                          text: ' (元) ',
                                          style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 6.w,
                                ),
                                BaseText(text: (c.state.accountViewModel?.balance??0).bankBalance,
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                ),)
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '昨日收益',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.white)),
                                      TextSpan(
                                          text: ' (元) ',
                                          style: TextStyle(color: Colors.white, fontSize: 10.sp)),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6.w,
                                ),
                                BaseText(text: '--',style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white
                                ),)
                              ],
                            ),

                          ],
                        ).withPadding(top: 24.w,left: 18.w,right: 18.w),
                      ],
                    ),
                  ),

                  showInfo? Container(
                    height: 470.w,
                    width:1.sw,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: 'bg_account_preview_top2'.png3x,
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Container(
                      width: 350.w,
                      height: 470.w,
                      color: const Color(0xff485AB5),
                      child: const AccountPreviewChatWidget(),
                    ),
                  ):const SizedBox.shrink(),

                  Container(
                    width: 350.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: 'bg_account_preview_info2'.png3x,
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BaseText(text: "资产视图",fontSize: 15.sp,color: Colors.white,),
                        Image(image: "ic_zc_details".png3x,width: 25.w,height: 25.w,color: Colors.white,)
                      ],
                    ),
                  ).withOnTap(onTap: (){
                    showInfo = !showInfo;
                    setState(() {});
                  })
                ],
              );
            },id: 'updateAccountView',),
            Container(
              height: 12.w,
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: infoDataList.map((e) {
                return Column(
                  children: [
                    Image(
                      image: '${e['image']}'.png3x,
                      width: 30.w,
                      height: 30.w,
                    ),
                    SizedBox(
                      height: 6.w,
                    ),
                    BaseText(
                      text: e['name'],
                      fontSize: 12.sp,
                    )
                  ],
                ).withOnTap(onTap: (){jumpPage(e['name']);});
              }).toList(),
            ).withContainer(
              decoration: const BoxDecoration(
                color: Colors.white,//const Color(0xffF6F6F6),
              ),
            ),
            Container(
              height: 15.w,
              color: Colors.white,
            ),

            GetBuilder(builder: (AccountPreviewLogic c){
              return Container(
                width: 1.sw,
                height: 80.w,
                // margin: EdgeInsets.only(left: 12.w,right: 12.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(text: (c.state.accountViewModel?.balance??0).bankBalance,
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color:c.selectData == '1'? const Color(0xFF3040A5):const Color(0xff333333),
                            ),),
                          BaseText(text: '活期',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color:c.selectData == '1'? const Color(0xFF3040A5):const Color(0xff333333),
                          ),).withPadding(
                            top: 4.w,bottom: 4.w,
                          ),
                          c.selectData == '1'?Container(
                            width: 25.w,
                            height: 3.w,
                            decoration: BoxDecoration(
                              color:c.selectData == '1'? const Color(0xFF3040A5):const Color(0xff333333),
                              borderRadius: BorderRadius.all(Radius.circular(1.5.w))
                            ),
                          ):const SizedBox.shrink(),
                        ],
                      ).withOnTap(onTap: ()=> c.changeSelect('1')),
                    )),

                    Expanded(child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BaseText(text: '--',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color:c.selectData == '2'? const Color(0xFF3040A5):const Color(0xff333333),
                            ),),
                          BaseText(text: '持仓总额',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: c.selectData == '2'? const Color(0xFF3040A5):const Color(0xff333333),
                            ),).withPadding(
                            top: 4.w,bottom: 4.w,
                          ),
                          c.selectData == '2'?  Container(
                            width: 25.w,
                            height: 3.w,
                            decoration: BoxDecoration(
                                color: c.selectData == '2'? const Color(0xFF3040A5):const Color(0xff333333),
                                borderRadius: BorderRadius.all(Radius.circular(1.5.w))
                            ),
                          ):const SizedBox.shrink(),
                        ],
                      ).withOnTap(onTap: ()=> c.changeSelect('2')),
                    )),
                  ],
                ),
              );
            },id: 'changeSelect',),

            Container(
              height: 12.w,
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                border: Border.all(
                  width: 0,
                  color: const Color(0xffF6F6F6),
                ),
              ),
            ),

            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                      text: '资产',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TextSpan(
                      text: '(含外币折合)',
                      style: TextStyle(color: Colors.black, fontSize: 12.sp)),
                ],
              ),
            ).withPadding(
                left: 12.w,right: 12.w
            ).withContainer(
              color: const Color(0xffF6F6F6),
            ),
            Container(
              height: 12.w,
              decoration: BoxDecoration(
                color: const Color(0xffF6F6F6),
                border: Border.all(
                  width: 0,
                  color: const Color(0xffF6F6F6),
                ),
              ),
            ),
            GetBuilder(builder: (AccountPreviewLogic c){
              return _itemCell(
                '活期',
                (c.state.accountViewModel?.balance??0).bankBalance,
                show: c.showMore,).withPadding(
                  left: 12.w,right: 12.w
              ).withContainer(
                color: const Color(0xffF6F6F6),
              ).withOnTap(onTap: (){
                c.changeShowMore(!c.showMore);
              });
            },id: 'updateCell',),
            Container(
              height: 8.w,
              color: const Color(0xffF6F6F6),
            ),
            Container(
              width: 350.w,
              // decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.all(Radius.circular(8.w))),
              child: Column(
                children: [
                  _itemCell('持仓总额', '¥--'),
                  Container(
                    height: 10.w,
                    color:  const Color(0xffF6F6F6),
                  ),
                  _itemCell('龙钱宝1号', '零钱理财、能赚还能花',onTap: (){
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '龙钱包1号',
                      'image': 'bg_lqb1h',
                      'defTitleColor': Colors.black
                    });
                  }),
                  Container(
                    height: 10.w,
                    color:  const Color(0xffF6F6F6),
                  ),
                  _itemCell('龙钱宝2号', '灵活交易超省心',onTap: (){
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '龙钱包2号',
                      'image': 'bg_lqb2h',
                      'defTitleColor': Colors.black
                    });
                  }),
                  Container(
                    height: 10.w,
                    color:  const Color(0xffF6F6F6),
                  ),
                  _itemCell('存款产品', '起存点低、安全稳健',onTap: (){
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '存款产品',
                      'image': 'bg_ckcp',
                    });
                  }),
                  Container(
                    height: 10.w,
                    color:  const Color(0xffF6F6F6),
                  ),
                  _itemCell('基金', '优选基金、一元起投',onTap: (){
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '基金投资',
                      'image': 'bg_jjtz',
                    });
                  }),
                  Container(
                    height: 10.w,
                    color:  const Color(0xffF6F6F6),
                  ),
                  _itemCell('理财产品', '理财有方、稳重求进',onTap: (){
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '理财产品',
                      'image': 'bg_lccp',
                    });
                  }),
                  Container(
                    height: 10.w,
                    color:  const Color(0xffF6F6F6),
                  ),
                  _itemCell('保险', '多重保障、关爱生命',onTap: (){
                    Get.toNamed(Routes.changeNavPage, arguments: {
                      'title': '保险',
                      'image': 'bg_baoxian',
                    });
                    return;
                  }),
                ],
              ),
            ).withContainer(
              padding:EdgeInsets.only(left: 12.w,right: 12.w),
              color: const Color(0xffF6F6F6),
            ),

            Container(
              height: 55.w,
              color: const Color(0xffF6F6F6),
            ),

            Container(
              width: 1.sw,
              height: 31.w,
              alignment: Alignment.center,
              color: const Color(0xffF6F6F6),
              child: Image(image: 'ic_a_p_log'.png3x,width: 181.w,height: 31.w,),
            ),
            Container(
              height: ScreenUtil().bottomBarHeight + 15.w,
              color: const Color(0xffF6F6F6),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemCell(String title, String content,{Function? onTap,bool show = false}) {
    Color textColor =
        title == '持仓总额' || title == '活期'
            ? Colors.black : const Color(0xff666666);
    FontWeight textFont =
    title == '持仓总额' || title == '活期'
        ? FontWeight.bold :FontWeight.w600;

    double fontSize =
    title == '持仓总额' || title == '活期'
        ? 16.sp : 15.sp;
    return Container(
      width: 350.w,
      height:  title == '持仓总额'?40.w:show?(title == '活期'?100:50.w):50.w,
      padding: EdgeInsets.only(
        left: title == '持仓总额'?0.w:12.w,
        right: 12.w,
        top: title == '持仓总额'?6.w:0.w,
      ),
      decoration: BoxDecoration(
          color: title == '持仓总额'? const Color(0xffF6F6F6):Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  BaseText(
                    text: title,
                    style: TextStyle(
                      fontWeight: textFont,
                      fontSize: fontSize,
                    ),
                  ),
                  SizedBox(width: 4.w,),
                  if (title == '活期')
                    Image(image: show?'ic_mx_sx1_2'.png3x:'ic_mx_sx1'.png3x,width: 10.w,height: 10.w,)
                ],
              ),

              title == '持仓总额'?const SizedBox.shrink():Row(
                children: [
                  BaseText(
                    text: content,
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: textColor,
                        fontWeight: FontWeight.w600
                    ),
                    color: textColor,
                  ),
                  if (title != '持仓总额')
                    const Icon(Icons.navigate_next_sharp, color: Color(0xff666666),
                    )
                ],
              ).withOnTap(onTap: onTap)
            ],
          ).withSizedBox(
            height: title == '持仓总额'?30.w:50.w
          ),

          if(title == '活期' && show)
          GetBuilder(builder: (AccountPreviewLogic c){
            return Container(
              height: 45.w,
              padding: EdgeInsets.only(left: 20.w),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BaseText(
                    text: '尾号${AppConfig.config.balanceLogic.memberInfo.bankList.first.bankCard.getLastFourByList()}',
                    fontSize: 14.sp,
                  ),

                  Row(
                    children: [
                      BaseText(
                        text: content,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(width: 4.w,),
                      const Icon(Icons.navigate_next_sharp, color: Color(0xff666666),)
                    ],
                  ),
                ],
              ),
            );
          },id: 'updateCell',)
        ],
      ),
    );
  }
}
