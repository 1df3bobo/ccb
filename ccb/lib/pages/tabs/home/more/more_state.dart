import 'package:flutter/material.dart';

class MoreState {
  MoreState();
  // 这里可以扩展页面状态
  // 当前选中的分组索引
  int selectedGroup = 0;
  // 右侧每个分组的key用于锚点滚动
  List<GlobalKey> groupKeys = [];
}
