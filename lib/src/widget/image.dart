import 'package:flutter/material.dart';

class WImageAsset {
  late String _name;
  WImageAsset(String name) {
    _name = 'assets/images/$name';
  }
  double? _width;
  double? _height;
  BoxFit? _fit;
  Image build() {
    return Image.asset(
      _name,
      width: _width,
      height: _height,
      fit: _fit,
    );
  }

  WImageAsset width(double width) {
    _width = width;
    return this;
  }

  WImageAsset height(double height) {
    _height = height;
    return this;
  }

  WImageAsset fit(BoxFit fit) {
    _fit = fit;
    return this;
  }

  WImageAsset fitWidth(double width) {
    _fit = BoxFit.fitWidth;
    _width = width;
    return this;
  }

  WImageAsset fitHeight(double height) {
    _fit = BoxFit.fitHeight;
    _height = height;
    return this;
  }

  // 按原始比例缩放，确保图像完全在目标框内，可能留白。
  WImageAsset fitContain() {
    _fit = BoxFit.contain;
    return this;
  }

  // 按原始比例缩放，覆盖整个目标框，超出部分会被裁剪。
  WImageAsset fitCover() {
    _fit = BoxFit.cover;
    return this;
  }
}
