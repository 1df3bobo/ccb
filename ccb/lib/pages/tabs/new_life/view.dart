import 'package:ccb/config/app_config.dart';
import 'package:ccb/utils/screen_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wb_base_widget/wb_base_widget.dart';

import '../../../utils/color_util.dart';
import '../../../utils/common_banner_widget.dart';
import 'component/life_grid_widget.dart';
import 'component/hot_movie_section.dart';
import 'logic.dart';
import 'state.dart';

class NewLifePage extends BaseStateless {
  NewLifePage({super.key});

  final NewLifeLogic logic = Get.put(NewLifeLogic());
  final NewLifeState state = Get.find<NewLifeLogic>().state;

  @override
  bool get isChangeNav => true;

  @override
  String get navTitle => '';

  @override
  Widget? get leftItem => Container();

  @override
  bool get isShowNav => true;

  @override
  bool get isShowLeading => false;

  @override
  Widget? get titleWidget => _buildTitle();

  @override
  double? get lefItemWidth => 20.w;

  @override
  List<Widget>? get rightAction => [
    NavActionWidget(
      left: 8.w,
      title: '客服',
      image: 'card/ear_icon',
    ),
    NavActionWidget(
      left: 4.w,
      title: '订单',
      image: 'card/order',
    ),
  ];

  @override
  Widget initBody(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFFFBF1E8),
            Color(0xFFFEFBF8),
            Color(0xFFFFFFFF),
          ],
          stops: [0,0.6,1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: navigateHeight),
        child: Column(
          children: [
            _buildTopBanner(),
            const LifeGridWidget(),
            _buildSectionImage('assets/new_images/life/local_free.png'),
            _buildSectionImage('assets/new_images/life/local_offers_banner_1.png'),
            _buildSectionImage('assets/new_images/life/life_payment_bg.png'),
            HotMovieSection(),
            _builLifeBanner(),
            _buildSectionImage('assets/new_images/life/surprise_618_banner.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBanner() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: CommonBannerWidget(
        // aspectRatio:  375 / 349,
        imagePaths: state.topBanners,
      ),
    );
  }


  Widget _builLifeBanner() {
    return Stack(
      children: [
        Image(image: 'life/section_gov_services'.newPng, fit: BoxFit.fitWidth),
        Positioned(
          left: 20.w,
          top: 56.h,
          bottom: 20.h,
          child: SizedBox(
            width: 170.w,
            child: CommonBannerWidget(
              imagePaths: state.lifeBanners,
              autoPlay: true,
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }


  Widget _buildSectionImage(String imagePath) {
    return Image.asset(
      imagePath,
      fit: BoxFit.fitWidth,
    );
  }

  Widget _buildTitle() {
    return Row(
      children: [
        Row(
          children: [
            Image(image: 'card/location_icon'.png, width: 14.w, height: 16.h),
            SizedBox(width: 4.w),
            Text(AppConfig.config.balanceLogic.memberInfo.city, style: TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w500)),
          ],
        ),
        SizedBox(width: 12.w),
        const Expanded(
          child: PlaceholderSearchWidget(
            contentList: ['财富会员', '养老金火热', '建行出行享优惠'],
            bgColor: Color.fromRGBO(255, 255, 255, 0.66),
          ),
        ),
        SizedBox(width: 12.w),
      ],
    );
  }
}
