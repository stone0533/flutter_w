import 'package:flutter/widgets.dart';

extension WTextStyle on TextStyle {
  static TextStyle fromConfig({required WTextStyleConfig config}) {
    return TextStyle(
      fontFamily: config._fontFamily,
      fontWeight: config._fontWeight,
      fontSize: config._fontSize,
      color: config._color,
      letterSpacing: config._letterSpacing,
      overflow: config._overflow,
      decoration: config._decoration,
      decorationColor: config._decorationColor,
    );
  }
}

class WTextStyleConfig {
  TextStyle build() {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: _fontWeight,
      fontSize: _fontSize,
      color: _color,
      letterSpacing: _letterSpacing,
      overflow: _overflow,
      decoration: _decoration,
      decorationColor: _decorationColor,
    );
  }

  String? _fontFamily;
  FontWeight? _fontWeight;
  double? _fontSize;
  Color? _color;
  double? _letterSpacing;
  TextOverflow? _overflow;
  TextDecoration? _decoration;
  Color? _decorationColor;
  WTextStyleConfig family(String fontFamily) {
    _fontFamily = fontFamily;
    return this;
  }

  WTextStyleConfig familyNotoSansTC() {
    _fontFamily = 'NotoSansTC';
    return this;
  }

  WTextStyleConfig familyZenMaruGothic() {
    _fontFamily = 'ZenMaruGothic';
    return this;
  }

  WTextStyleConfig weight(int fontWeight) {
    switch (fontWeight) {
      case 100:
        _fontWeight = FontWeight.w100;
        break;
      case 200:
        _fontWeight = FontWeight.w200;
        break;
      case 300:
        _fontWeight = FontWeight.w300;
        break;
      case 400:
        _fontWeight = FontWeight.w400;
        break;
      case 500:
        _fontWeight = FontWeight.w500;
        break;
      case 600:
        _fontWeight = FontWeight.w600;
        break;
      case 700:
        _fontWeight = FontWeight.w700;
        break;
      case 800:
        _fontWeight = FontWeight.w800;
        break;
      case 900:
        _fontWeight = FontWeight.w900;
        break;
    }
    return this;
  }

  WTextStyleConfig size(double fontSize) {
    _fontSize = fontSize;
    return this;
  }

  WTextStyleConfig color(Color color) {
    _color = color;
    return this;
  }

  WTextStyleConfig letterSpacing(double letterSpacing) {
    _letterSpacing = letterSpacing;
    return this;
  }

  WTextStyleConfig overflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  WTextStyleConfig overflowEllipsis() {
    _overflow = TextOverflow.ellipsis;
    return this;
  }

  WTextStyleConfig decoration(TextDecoration decoration) {
    _decoration = decoration;
    return this;
  }

  WTextStyleConfig decorationUnderline({Color? decorationColor}) {
    _decoration = TextDecoration.underline;
    _decorationColor = decorationColor ?? _color;
    assert(_decorationColor == null);
    return this;
  }

  WTextStyleConfig decorationColor(Color decorationColor) {
    _decorationColor = decorationColor;
    return this;
  }

  WTextStyleConfig wsc(int fontWeight, double fontSize, Color color) {
    this
      ..weight(fontWeight)
      ..size(fontSize)
      ..color(color);
    return this;
  }
}
