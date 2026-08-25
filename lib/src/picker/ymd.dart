import 'package:flutter/material.dart';
import 'package:flutter_picker/picker.dart';

extension WPicker on Picker {
  static Picker ymdPicker({
    String? yearSuffix,
    String? monthSuffix,
    String? daySuffix,
    DateTime? minValue,
    DateTime? maxValue,
    DateTime? value,
    TextStyle? textStyle,
    TextStyle? selectedTextStyle,
  }) {
    return Picker(
      adapter: DateTimePickerAdapter(
        type: PickerDateTimeType.kYMD,
        isNumberMonth: true,
        yearSuffix: yearSuffix,
        monthSuffix: monthSuffix,
        daySuffix: daySuffix,
        maxValue: maxValue,
        minValue: minValue,
        value: value,
      ),
      hideHeader: true,
      textStyle: textStyle,
      selectedTextStyle: selectedTextStyle,
    );
  }
}
