import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class WBotToast {
  static CancelFunc showDialog(
      {required Widget Function(CancelFunc cancelFunc) toastBuilder,
      Alignment? align,
      void Function()? onClose,
      Duration? duration,
      Color? backgroundColor}) {
    return BotToast.showCustomLoading(
      toastBuilder: toastBuilder,
      align: align ?? Alignment.center,
      onClose: () {
        Future.delayed(
          const Duration(milliseconds: 1),
          () {
            onClose?.call();
          },
        );
      },
      backgroundColor: backgroundColor ?? Colors.black38,
      duration: duration,
      clickClose: false,
      allowClick: false,
    );
  }
}

class WBotToastConfig {
  late Duration? duration;
  //
  static final WBotToastConfig _instance = WBotToastConfig._internal();
  WBotToastConfig._internal() {
    /// set deafult value
    duration = const Duration(milliseconds: 800);
  }

  static WBotToastConfig get instance => _instance;
}
