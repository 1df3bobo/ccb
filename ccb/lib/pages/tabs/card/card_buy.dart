import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';

class CardBuyWidget extends StatefulWidget {
  const CardBuyWidget({super.key});

  @override
  State<CardBuyWidget> createState() => _CardBuyWidgetState();
}

class _CardBuyWidgetState extends State<CardBuyWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 0.w, right: 0.w),
      child: _containerBg(width: 350.w, height: 260.w, imagePath: 'card_buy'),
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
