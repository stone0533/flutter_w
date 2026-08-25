import 'package:flutter/cupertino.dart';

class WClipRRect extends StatelessWidget {
  final WClipRRectConfig config;
  final Widget child;
  const WClipRRect({super.key, required this.config, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: config._borderRadius,
      child: child,
    );
  }
}

class WClipRRectConfig {
  BorderRadiusGeometry _borderRadius = BorderRadius.zero;

  WClipRRectConfig borderRadius(BorderRadiusGeometry borderRadius) {
    _borderRadius = borderRadius;
    return this;
  }

  WClipRRectConfig borderRadiusAll(double radius) {
    _borderRadius = BorderRadius.all(Radius.circular(radius));
    return this;
  }
}

// class WClipRRect {
//   BorderRadiusGeometry _borderRadius = BorderRadius.zero;
//   Widget? _child;
//
//   WClipRRect({Widget? child}) {
//     _child = child;
//   }
//
//   ClipRRect build() {
//     return ClipRRect(
//       borderRadius: _borderRadius,
//       child: _child,
//     );
//   }
//
//   WClipRRect borderRadius(BorderRadiusGeometry borderRadius) {
//     _borderRadius = borderRadius;
//     return this;
//   }
//
//   WClipRRect borderRadiusAll(double radius) {
//     _borderRadius = BorderRadius.all(Radius.circular(radius));
//     return this;
//   }
// }
