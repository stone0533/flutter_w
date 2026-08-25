import 'package:flutter/material.dart';

extension WSizeBox on SizedBox {
  static SizedBox height(double height) {
    return SizedBox(height: height);
  }

  static SizedBox width(double width) {
    return SizedBox(width: width);
  }
}
