import 'package:get/get.dart';

class MoreLogic extends GetxController {
  // 顶部横向应用栏
  final appList = [
    {'icon': 'assets/new_images/home/more/mine_1.png', 'label': '应用1'},
    {'icon': 'assets/new_images/home/more/mine_2.png', 'label': '应用2'},
    {'icon': 'assets/new_images/home/more/mine_3.png', 'label': '应用3'},
    {'icon': 'assets/new_images/home/more/mine_5.png', 'label': '应用4'},
    {'icon': 'assets/new_images/home/more/mine_6.png', 'label': '应用5'},
    {'icon': 'assets/new_images/home/more/mine_7.png', 'label': '应用6'},
    {'icon': 'assets/new_images/home/more/more.png', 'label': '应用6'},
  ].obs;

  // 左侧分组
  final List<String> groupList = [
    '为您推荐',
    '账户',
    '转账',
    '支付',
    '财富',
    '信用卡',
    '贷款服务',
    '跨境服务',
    '生活服务',
    '网点服务',
    '福利',
    '其他'
  ];

  // 右侧分组及功能项（图标名为拼音首字母，label为中文）
  final List<Map<String, dynamic>> groupData = [
    {
      'title': '为您推荐',
      'mode': 'items',
      'items': [
        {'icon': 'szrmb', 'label': '数字人民币'},
        {'icon': 'yjbk', 'label': '一键绑卡'},
      ]
    },
    {
      'title': '账户',
      'mode': 'items',
      'items': [
        {'icon': 'zhzl', 'label': '账户总揽'},
        {'icon': 'zhmx', 'label': '账户明细'},
        {'icon': 'lsdy', 'label': '流水打印'},
        {'icon': 'ykbb', 'label': '用卡必备'},
        {'icon': 'xxt', 'label': '新享通'},
        {'icon': 'dzgzd', 'label': '电子工资单'},
        {'icon': 'qynj', 'label': '企业年金'},
        {'icon': 'grylj', 'label': '个人养老金'},
        {'icon': 'szrmb', 'label': '数字人民币'},
      ]
    },
    {
      'title': '转账',
      'mode': 'items',
      'items': [
        {'icon': 'zzhk', 'label': '转账汇款'},
        {'icon': 'yhzhzz', 'label': '银行账号转账'},
        {'icon': 'sjhzz', 'label': '手机号转账'},
        {'icon': 'thzr', 'label': '他行转入'},
        {'icon': 'zjgj', 'label': '资金归集'},
        {'icon': 'skrmc', 'label': '收款人名册'},
        {'icon': 'zzjl', 'label': '转账记录'},
        {'icon': 'zzsz', 'label': '转账设置'},
        {'icon': 'sjhsk', 'label': '手机号收款'},
        {'icon': 'yyzz', 'label': '预约转账'},
        {'icon': 'plzz', 'label': '批量转账'},
        {'icon': 'jnwbzz', 'label': '境内外币转账'},
        {'icon': 'gyjk', 'label': '公益捐款'},
      ]
    },
    {
      'title': '支付',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/zf_section.png'
    },
    {
      'title': '财富',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/cf_section.png'
    },
    {
      'title': '信用卡',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/xyk_section.png'
    },
    {
      'title': '贷款服务',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/dkfw_section.png'
    },
    {
      'title': '跨境服务',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/kjfw_section.png'
    },
    {
      'title': '生活服务',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/shfw_section.png'
    },
    {
      'title': '网点服务',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/wdfw_section.png'
    },
    {
      'title': '福利',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/fl_section.png'
    },
    {
      'title': '其他',
      'mode': 'section',
      'items': [],
      'image': 'assets/new_images/home/more/qt_section.png'
    },
    // 其余分组可根据截图继续补充
  ];
}
