import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class AdBannerWidget extends StatefulWidget {
  const AdBannerWidget({super.key});

  @override
  State<AdBannerWidget> createState() => _AdBannerWidgetState();
}

class _AdBannerWidgetState extends State<AdBannerWidget> {
  List list = ['ic_home_gd', 'ic_home_gd', 'ic_home_gd'];

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image(
          image: '${list[index]}$index'.png3x,
          width: 350.w,
          height: 110.w,
          fit: BoxFit.fill,
        );
      },
      itemCount: list.length,
      autoplay: true,
    ).withContainer(
      width: 1.sw,
      height: 90.w,
    );
  }
}
