import 'package:flutter/material.dart';

class WContainer extends StatelessWidget {
  final WContainerConfig config;
  final Widget? child;
  const WContainer({super.key, required this.config, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: config._border,
        borderRadius: config._borderRadius,
        color: config._color,
        boxShadow: config._boxShadow,
        shape: config._shape,
        gradient: config._gradient,
      ),
      width: config._width,
      height: config._height,
      alignment: config._alignment,
      margin: config._margin,
      padding: config._padding,
      clipBehavior: config._clipBehavior,
      transform: config._transform,
      constraints: config._constraints,
      child: child,
    );
  }
}

class WContainerConfig {
  double? _width;
  double? _height;
  BoxBorder? _border;
  BorderRadiusGeometry? _borderRadius;
  Color? _color;
  AlignmentGeometry? _alignment;
  EdgeInsetsGeometry? _margin;
  EdgeInsetsGeometry? _padding;
  List<BoxShadow>? _boxShadow;
  Clip _clipBehavior = Clip.none;
  BoxShape _shape = BoxShape.rectangle;
  Gradient? _gradient;
  Matrix4? _transform;
  BoxConstraints? _constraints;

  WContainerConfig width(double? width) {
    _width = width;
    return this;
  }

  WContainerConfig height(double? height) {
    _height = height;
    return this;
  }

  WContainerConfig size(double? size) {
    _height = size;
    _width = size;
    return this;
  }

  WContainerConfig borderAll(double width, Color color) {
    _border = Border.all(width: width, color: color);
    return this;
  }

  WContainerConfig borderBottom(double width, Color color) {
    _border = Border(bottom: BorderSide(width: width, color: color));
    return this;
  }

  WContainerConfig borderRadiusAll(double radius) {
    _borderRadius = BorderRadius.all(Radius.circular(radius));
    return this;
  }

  WContainerConfig borderRadiusTop(double radius) {
    _borderRadius = BorderRadius.vertical(top: Radius.circular(radius));
    return this;
  }

  WContainerConfig color(Color? color) {
    _color = color;
    return this;
  }

  WContainerConfig alignment(AlignmentGeometry? alignment) {
    _alignment = alignment;
    return this;
  }

  WContainerConfig alignmentCenter() {
    _alignment = Alignment.center;
    return this;
  }

  WContainerConfig alignmentCenterLeft() {
    _alignment = Alignment.centerLeft;
    return this;
  }

  WContainerConfig alignmentCenterRight() {
    _alignment = Alignment.centerRight;
    return this;
  }

  WContainerConfig margin(EdgeInsetsGeometry? margin) {
    _margin = margin;
    return this;
  }

  WContainerConfig marginSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    _margin = EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
    return this;
  }

  WContainerConfig padding(EdgeInsetsGeometry? padding) {
    _padding = padding;
    return this;
  }

  WContainerConfig paddingAll(double value) {
    _padding = EdgeInsets.all(value);
    return this;
  }

  WContainerConfig paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    _padding = EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal);
    return this;
  }

  WContainerConfig boxShadow(List<BoxShadow> boxShadow) {
    _boxShadow = boxShadow;
    return this;
  }

  WContainerConfig clipBehavior(Clip clipBehavior) {
    clipBehavior = clipBehavior;
    return this;
  }

  WContainerConfig clipBehaviorAntiAlias() {
    _clipBehavior = Clip.antiAlias;
    return this;
  }

  WContainerConfig shape(BoxShape shape) {
    _shape = shape;
    return this;
  }

  WContainerConfig shapeCircle() {
    _shape = BoxShape.circle;
    return this;
  }

  WContainerConfig gradient(Gradient gradient) {
    _gradient = gradient;
    return this;
  }

  WContainerConfig gradientLinearTopToBottom(List<Color> colors) {
    _gradient = LinearGradient(colors: colors, begin: Alignment.topCenter, end: Alignment.bottomCenter);
    return this;
  }

  WContainerConfig transform(Matrix4? transform) {
    _transform = transform;
    return this;
  }

  WContainerConfig transformY(double y) {
    _transform = Matrix4.translationValues(0, y, 0);
    return this;
  }

  WContainerConfig constraints(BoxConstraints? constraints) {
    _constraints = constraints;
    return this;
  }

  WContainerConfig constraintsMinHeight(double minHeight) {
    _constraints = BoxConstraints(minHeight: minHeight);
    return this;
  }
}
