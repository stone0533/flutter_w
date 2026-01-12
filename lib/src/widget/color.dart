import 'package:flutter/material.dart';

// class HexColor {
//   static Color fromHex(String hexString) {
//     String hex = hexString.replaceAll('#', '');
//     if (hex.length == 6) {
//       hex = 'FF$hex'; // 默认透明度为1（FF）
//     } else if (hex.length == 3) {
//       hex = 'FF${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}'; // 简写形式
//     }
//     return Color(int.parse(hex, radix: 16));
//   }
// }

extension HexColor on Color {
  static Color fromHex(String hexString) {
    String hex = hexString.replaceAll('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // 默认透明度为1（FF）
    } else if (hex.length == 3) {
      hex = 'FF${hex[0]}${hex[0]}${hex[1]}${hex[1]}${hex[2]}${hex[2]}'; // 简写形式
    }
    return Color(int.parse(hex, radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
