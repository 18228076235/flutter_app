import 'package:flutter/widgets.dart';
import 'package:wanandroid_app/style/dimens.dart';

class Gaps {
  /// 水平间隔
  static Widget wGap5 = SizedBox(width: Dimens.gap_dp5);
  static Widget wGap10 = SizedBox(width: Dimens.gap_dp10);
  static Widget wGap15 = SizedBox(width: Dimens.gap_dp15);
  static Widget wGap30 = SizedBox(width: Dimens.gap_dp30);

  /// 垂直间隔
  static Widget hGap5 = SizedBox(height: Dimens.gap_dp5);
  static Widget hGap10 = SizedBox(height: Dimens.gap_dp10);
  static Widget hGap15 = SizedBox(height: Dimens.gap_dp15);
  static Widget getHGap(double h) {
    return SizedBox(height: h);
  }

  static Widget getWGap(double w) {
    return SizedBox(width: w);
  }
}
