import 'package:flutter/material.dart';

extension WGlobalKeyExtension on GlobalKey {
  Offset? offset() {
    RenderBox? renderBox = currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero);
  }

  Rect? rect() {
    RenderBox? renderBox = currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.paintBounds;
  }
}
