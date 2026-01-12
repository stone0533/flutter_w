import 'dart:ui';

import 'package:flutter_w/src/widget/color.dart';

extension WStringExtension on String {
  ///
  int? toInt() {
    return int.tryParse(this);
  }

  double? toDouble() {
    return double.tryParse(this);
  }

  num? toNum() {
    return num.tryParse(this);
  }

  /// 删除全部空格
  String trimAll() {
    return replaceAll(RegExp(r"\s+|\s+\b|\b\s"), '');
  }

  Color toColor() {
    return HexColor.fromHex(this);
  }
}
