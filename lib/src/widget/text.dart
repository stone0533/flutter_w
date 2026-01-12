import 'package:flutter/material.dart';

class WText extends StatelessWidget {
  final WTextConfig config;
  final String text;
  const WText({super.key, required this.config, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: config._fontFamily,
        fontWeight: config._fontWeight,
        fontSize: config._fontSize,
        color: config._color,
        letterSpacing: config._letterSpacing,
        overflow: config._overflow,
        decoration: config._decoration,
        decorationColor: config._decorationColor,
      ),
      strutStyle: StrutStyle(
        forceStrutHeight: config._forceStrutHeight ?? true,
      ),
      textAlign: config._textAlign,
    );
    ;
  }
}

class WTextConfig {
  String? _fontFamily;
  FontWeight? _fontWeight;
  double? _fontSize;
  Color? _color;
  double? _letterSpacing;
  bool? _forceStrutHeight;
  TextOverflow? _overflow;
  TextDecoration? _decoration;
  Color? _decorationColor;
  TextAlign? _textAlign;
  TextBaseline? _textBaseline;

  WTextConfig family(String? fontFamily) {
    _fontFamily = fontFamily;
    return this;
  }

  WTextConfig familyNotoSansTC() {
    _fontFamily = 'NotoSansTC';
    return this;
  }

  WTextConfig familyZenMaruGothic() {
    _fontFamily = 'ZenMaruGothic';
    return this;
  }

  WTextConfig weight(int? fontWeight) {
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

  WTextConfig size(double? fontSize) {
    _fontSize = fontSize;
    return this;
  }

  WTextConfig color(Color? color) {
    _color = color;
    return this;
  }

  WTextConfig letterSpacing(double? letterSpacing) {
    _letterSpacing = letterSpacing;
    return this;
  }

  WTextConfig forceStrutHeight(bool? forceStrutHeight) {
    _forceStrutHeight = forceStrutHeight;
    return this;
  }

  WTextConfig forceStrutHeightFalse() {
    _forceStrutHeight = false;
    return this;
  }

  WTextConfig overflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  WTextConfig overflowEllipsis() {
    _overflow = TextOverflow.ellipsis;
    return this;
  }

  WTextConfig decoration(TextDecoration decoration) {
    _decoration = decoration;
    return this;
  }

  WTextConfig decorationUnderline({Color? decorationColor}) {
    _decoration = TextDecoration.underline;
    _decorationColor = decorationColor ?? _color;
    return this;
  }

  WTextConfig decorationColor(Color decorationColor) {
    _decorationColor = decorationColor;
    return this;
  }

  WTextConfig textAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  WTextConfig textAlignCenter() {
    _textAlign = TextAlign.center;
    return this;
  }

  WTextConfig textBaseline(TextBaseline? textBaseline) {
    _textBaseline = textBaseline;
    return this;
  }
}

class WTextBuild {
  late String _data;
  WTextBuild(String data) {
    _data = data;
  }

  String? _fontFamily;
  FontWeight? _fontWeight;
  double? _fontSize;
  Color? _color;
  double? _letterSpacing;
  bool? _forceStrutHeight;
  TextOverflow? _overflow;
  TextDecoration? _decoration;
  Color? _decorationColor;
  TextAlign? _textAlign;

  Text build() {
    return Text(
      _data,
      style: TextStyle(
        fontFamily: _fontFamily,
        fontWeight: _fontWeight,
        fontSize: _fontSize,
        color: _color,
        letterSpacing: _letterSpacing,
        overflow: _overflow,
        decoration: _decoration,
        decorationColor: _decorationColor,
      ),
      strutStyle: StrutStyle(
        forceStrutHeight: _forceStrutHeight ?? true,
      ),
      textAlign: _textAlign,
    );
  }

  WTextBuild family(String? fontFamily) {
    _fontFamily = fontFamily;
    return this;
  }

  WTextBuild familyNotoSansTC() {
    _fontFamily = 'NotoSansTC';
    return this;
  }

  WTextBuild familyZenMaruGothic() {
    _fontFamily = 'ZenMaruGothic';
    return this;
  }

  WTextBuild weight(int? fontWeight) {
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

  WTextBuild size(double? fontSize) {
    _fontSize = fontSize;
    return this;
  }

  WTextBuild color(Color? color) {
    _color = color;
    return this;
  }

  WTextBuild letterSpacing(double? letterSpacing) {
    _letterSpacing = letterSpacing;
    return this;
  }

  WTextBuild forceStrutHeight(bool? forceStrutHeight) {
    _forceStrutHeight = forceStrutHeight;
    return this;
  }

  WTextBuild forceStrutHeightFalse() {
    _forceStrutHeight = false;
    return this;
  }

  WTextBuild overflow(TextOverflow overflow) {
    _overflow = overflow;
    return this;
  }

  WTextBuild overflowEllipsis() {
    _overflow = TextOverflow.ellipsis;
    return this;
  }

  WTextBuild decoration(TextDecoration decoration) {
    _decoration = decoration;
    return this;
  }

  WTextBuild decorationUnderline({Color? decorationColor}) {
    _decoration = TextDecoration.underline;
    _decorationColor = decorationColor ?? _color;
    return this;
  }

  WTextBuild decorationColor(Color decorationColor) {
    _decorationColor = decorationColor;
    return this;
  }

  WTextBuild textAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  WTextBuild textAlignCenter() {
    _textAlign = TextAlign.center;
    return this;
  }
}
