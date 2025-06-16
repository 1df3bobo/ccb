import 'package:ccb/pages/tabs/home/component/ad_banner_widget.dart';
import 'package:ccb/pages/tabs/home/component/function_banner_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_account_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_life_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_notice_widget.dart';
import 'package:ccb/pages/tabs/home/component/home_yanglao_widget.dart';
import 'package:ccb/pages/tabs/home/component/selective_widget.dart';
import 'package:ccb/pages/tabs/home/component/top_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/component/nav_action_widget.dart';
import 'package:wb_base_widget/component/placeholder_search_widget.dart';
import 'package:wb_base_widget/state_widget/state_less_widget.dart';

import '../../../routes/app_pages.dart';
import 'component/home_hose_widget.dart';
import 'home_logic.dart';
import 'home_state.dart';

class HomePage extends BaseStateless {
  HomePage({super.key});

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  Widget? get titleWidget => const PlaceholderSearchWidget(
        contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
      );

  @override
  double? get lefItemWidth => 0;

  @override
  Widget? get leftItem => Container();

  @override
  List<Widget>? get rightAction => [
        Obx(() => NavActionWidget(
              left: 16.w,
              color: logic.navActionColor.value,
              title: '客服',
              image: 'ic_home_customer',
            )),
        Obx(() => NavActionWidget(
              color: logic.navActionColor.value,
              title: '消息',
              image: 'ic_home_message',
              routesName: Routes.mineMessagePage,
            )),
      ];

  @override
  Function(bool change)? get onNotificationNavChange => (v) {
        logic.navActionColor.value = v ? Colors.black : Colors.white;
      };

  @override
  Widget initBody(BuildContext context) {
    return Container(
      color: const Color(0xffF6FCFF),
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          TopBannerWidget(),
          FunctionBannerWidget(),
          HomeNoticeWidget(),
          AdBannerWidget(),
          SelectiveWidget(),
          HomeAccountWidget(),
          HomeYangLaoWidget(),
          HomeLifeWidget(),
          HomeHoseWidget(),
        ],
      ),
    );
  }
}
