import 'package:ccb/pages/tabs/mine/component/mine_info_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wb_base_widget/extension/widget_extension.dart';


class MineTopWidget extends StatefulWidget {
  const MineTopWidget({super.key});

  @override
  State<MineTopWidget> createState() => _MineTopWidgetState();
}

class _MineTopWidgetState extends State<MineTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 232.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: 'bg_mine_top'.png3x,
          fit: BoxFit.cover,
        ),
      ),
      child:const MineInfoWidget()
    );
  }
}
