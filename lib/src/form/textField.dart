import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WFormBuilderTextField extends StatelessWidget {
  final WFormBuilderTextFieldConfig config;

  final String name;
  final ValueChanged<String?>? onChanged;
  final void Function(String?)? onSubmitted;
  final VoidCallback? onEditingComplete;

  const WFormBuilderTextField({
    super.key,
    required this.config,
    required this.name,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: config._height,
      alignment: Alignment.center,
      decoration: config._containerDecoration,
      margin: config._containerMargin,
      padding: config._containerPadding,
      child: Row(
        children: [
          config._leading ?? Container(),
          Expanded(
            child: Container(
              //transform: Matrix4.translationValues(0, -2.w, 0),
              child: FormBuilderTextField(
                focusNode: config._focusNode,
                name: name,
                initialValue: config._initialValue,
                textInputAction: config._textInputAction,
                readOnly: config._readOnly,
                onChanged: onChanged,
                cursorColor: config._style?.color,
                decoration: InputDecoration(
                  hintText: config._hintText,
                  hintStyle: config._hintStyle,
                  fillColor: Colors.transparent,
                  filled: true,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: config._contentPadding,
                  prefix: config._prefix,
                  prefixIcon: config._prefixIcon,
                  suffixIconConstraints: BoxConstraints(maxHeight: 20.w),
                  suffixIcon: null,
                  isCollapsed: true,
                ),
                style: config._readOnly == true ? config._readOnlyStyle ?? config._style : config._style,
                strutStyle: StrutStyle(
                  fontFamily: config._style?.fontFamily,
                  fontSize: config._style?.fontSize,
                  // leading: 0.5,
                  // forceStrutHeight: true,
                  // height: 1.2,
                ),
                obscureText: config._obscureText,
                obscuringCharacter: '＊',
                keyboardType: config._keyboardType,
                inputFormatters: config._inputFormatters,
                textAlign: config._textAlign ?? TextAlign.start,
                autofocus: config._autofocus ?? false,
                autocorrect: false,
                maxLines: config._maxLines ?? 1,
                onSubmitted: onSubmitted,
                onEditingComplete: onEditingComplete,
              ),
            ),
          ),
          ...?config._actions?.map(
            (action) => Container(
              height: config._height,
              alignment: Alignment.center,
              child: action,
            ),
          )
        ],
      ),
    );
  }
}

class WFormBuilderTextFieldConfig {
  String? _hintText;
  String? _initialValue;
  TextInputType? _keyboardType;
  List<TextInputFormatter>? _inputFormatters;

  bool _readOnly = false;
  TextStyle? _readOnlyStyle;

  double? _height;
  FocusNode? _focusNode;
  bool _obscureText = false;
  TextStyle? _style;
  EdgeInsetsGeometry? _contentPadding;
  TextStyle? _hintStyle;
  Color? _fillColor;
  Widget? _leading;
  List<Widget>? _actions;
  Decoration? _containerDecoration;
  EdgeInsetsGeometry? _containerMargin;
  EdgeInsetsGeometry? _containerPadding;
  TextAlign? _textAlign;
  bool? _autofocus;

  Widget? _prefix;
  Widget? _prefixIcon;
  bool? _isUnderLineType;
  int? _maxLines;
  TextInputAction? _textInputAction;

  WFormBuilderTextFieldConfig hintText(String? hintText) {
    _hintText = hintText;
    return this;
  }

  WFormBuilderTextFieldConfig initialValue(String? initialValue) {
    _initialValue = initialValue;
    return this;
  }

  WFormBuilderTextFieldConfig keyboardType(TextInputType? keyboardType) {
    _keyboardType = keyboardType;
    return this;
  }

  WFormBuilderTextFieldConfig inputFormatters(List<TextInputFormatter>? inputFormatters) {
    _inputFormatters = inputFormatters;
    return this;
  }

  WFormBuilderTextFieldConfig readOnly(bool readOnly) {
    _readOnly = readOnly;
    return this;
  }

  WFormBuilderTextFieldConfig readOnlyStyle(TextStyle? readOnlyStyle) {
    _readOnlyStyle = readOnlyStyle;
    return this;
  }

  WFormBuilderTextFieldConfig height(double? height) {
    _height = height;
    return this;
  }

  WFormBuilderTextFieldConfig focusNode(FocusNode? focusNode) {
    _focusNode = focusNode;
    return this;
  }

  WFormBuilderTextFieldConfig obscureText(bool obscureText) {
    _obscureText = obscureText;
    return this;
  }

  WFormBuilderTextFieldConfig style(TextStyle? style) {
    _style = style;
    return this;
  }

  WFormBuilderTextFieldConfig contentPadding(EdgeInsetsGeometry? contentPadding) {
    _contentPadding = contentPadding;
    return this;
  }

  WFormBuilderTextFieldConfig hintStyle(TextStyle? hintStyle) {
    _hintStyle = hintStyle;
    return this;
  }

  WFormBuilderTextFieldConfig fillColor(Color? fillColor) {
    _fillColor = fillColor;
    return this;
  }

  WFormBuilderTextFieldConfig leading(Widget? leading) {
    _leading = leading;
    return this;
  }

  WFormBuilderTextFieldConfig actions(List<Widget>? actions) {
    _actions = actions;
    return this;
  }

  WFormBuilderTextFieldConfig containerDecoration(Decoration? containerDecoration) {
    _containerDecoration = containerDecoration;
    return this;
  }

  WFormBuilderTextFieldConfig containerMargin(EdgeInsetsGeometry? containerMargin) {
    _containerMargin = containerMargin;
    return this;
  }

  WFormBuilderTextFieldConfig containerPadding(EdgeInsetsGeometry? containerPadding) {
    _containerPadding = containerPadding;
    return this;
  }

  WFormBuilderTextFieldConfig textAlign(TextAlign? textAlign) {
    _textAlign = textAlign;
    return this;
  }

  WFormBuilderTextFieldConfig autofocus(bool? autofocus) {
    _autofocus = autofocus;
    return this;
  }

  WFormBuilderTextFieldConfig prefix(Widget? prefix) {
    _prefix = prefix;
    return this;
  }

  WFormBuilderTextFieldConfig prefixIcon(Widget? prefixIcon) {
    _prefixIcon = prefixIcon;
    return this;
  }

  WFormBuilderTextFieldConfig isUnderLineType(bool? isUnderLineType) {
    _isUnderLineType = isUnderLineType;
    return this;
  }

  WFormBuilderTextFieldConfig maxLines(int? maxLines) {
    _maxLines = maxLines;
    return this;
  }

  WFormBuilderTextFieldConfig textInputAction(TextInputAction? textInputAction) {
    _textInputAction = textInputAction;
    return this;
  }
}
