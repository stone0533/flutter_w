import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'formBorder.dart';

class WFormBuilderData {
  // Form Key
  var formKey = GlobalKey<FormBuilderState>();

  // FormBuilder
  FormBuilderFields? get fields => formKey.currentState?.fields;
  Map<String, dynamic>? get value => formKey.currentState?.value;

  // 是否已输入
  Map<String, bool> fromEntered = {};
  // 是否已全部输入
  bool isAllEntered(int length) {
    return (fromEntered.length == length) && (fromEntered.containsValue(false) == false);
  }

  // 是否是有错误
  Map<String, bool> formShowErrorStyle = {};
  // 当前fields是否需要显示错误样式
  bool isShowErrorStyle(String name) {
    return formShowErrorStyle[name] ?? false;
  }

  // 设置fields的数据
  void changeValue<T>(String name, T value) {
    formKey.currentState?.fields[name]?.didChange(value);
  }

  // 内容修改后触发
  void onChange<T>(String name, T? value, {List<String>? updateList, VoidCallback? callback}) {
    formBorderKeys[name]?.currentState?.setError(false);
    if (value is String) {
      String? v = value;
      fromEntered[name] = v?.isNotEmpty ?? false;
      formShowErrorStyle[name] = false;
    }
    callback?.call();
  }

  // 获取filed的值
  dynamic getFieldsValue(String name) {
    return formKey.currentState?.fields[name]?.value;
  }

  // 设置错误样式
  void setError(String name, {Map<String, List<String>>? errorList, VoidCallback? callback}) {
    formShowErrorStyle[name] = true;
    errorList?.entries.forEach((a) {
      formBorderKeys[a.key]?.currentState?.setError(true, errorStrList: a.value);
    });
    callback?.call();
  }

  // FormBorderKey
  Map<String, GlobalKey<WFormBuilderBorderState>> formBorderKeys = {};
  GlobalKey<WFormBuilderBorderState> getFormBorderKey(String name) {
    if (formBorderKeys.containsKey(name) == false) {
      formBorderKeys[name] = GlobalKey<WFormBuilderBorderState>();
    }
    return formBorderKeys[name]!;
  }

  // close keyboard
  void closeKeyboard() {
    Get.focusScope?.unfocus();
  }
}
