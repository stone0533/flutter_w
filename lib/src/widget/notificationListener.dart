import 'package:flutter/material.dart';

class WNotificationListener {
  late Widget _child;
  WNotificationListener({required Widget child}) {
    _child = child;
  }
  bool Function(Notification)? _onNotification;
  void Function(double percentage)? _onNotificationPercentage;
  NotificationListener build() {
    return NotificationListener(
      onNotification: _onNotification ??
          (notification) {
            if (notification is ScrollStartNotification) {
              // 处理滚动开始事件
              return true;
            } else if (notification is ScrollUpdateNotification) {
              // //print(notification);
              // print('AAAAA');
              // print(notification.depth);
              // print(notification.metrics.extentBefore);
              // print(notification.metrics.extentInside);
              // print(notification.metrics.extentAfter);
              //print(notification.metrics.pixels);
              // print(notification.metrics.maxScrollExtent);
              // print(notification.metrics.pixels / notification.metrics.maxScrollExtent);
              if (notification.depth == 0) {
                double percentage = notification.metrics.pixels / notification.metrics.maxScrollExtent;
                _onNotificationPercentage?.call(percentage);
              }
              // 处理滚动更新事件
              return true;
            } else if (notification is ScrollEndNotification) {
              // 处理滚动结束事件
              return true;
            }
            return false;
          },
      child: _child,
    );
  }

  WNotificationListener onNotification(bool Function(Notification)? onNotification) {
    _onNotification = onNotification;
    return this;
  }

  WNotificationListener onNotificationPercentage(void Function(double percentage)? onNotificationPercentage) {
    _onNotificationPercentage = onNotificationPercentage;
    return this;
  }
}
