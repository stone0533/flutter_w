import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WGet {
  //
  static List<Route<dynamic>> routes = [];
  static void removeRouteIfExistByName(String page) {
    var route = routes.where((a) => a.settings.name?.compareTo(page) == 0).firstOrNull;
    if (route != null) {
      routes.remove(route);
      Get.removeRoute(route);
    }
  }

  static void removeRouteUntil(String page) {
    for (int i = routes.length - 1; i >= 0; i--) {
      var route = routes[i];
      if (route.settings.name?.compareTo(page) == 0) {
        break;
      }
      routes.remove(route);
      Get.removeRoute(route);
    }
  }

  static void until(String page) {
    Get.until((route) => Get.currentRoute == page);
  }

  //
  static bottomSheet(Widget bottomSheet) {
    Get.bottomSheet(
      Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(),
            ),
          ),
          bottomSheet,
        ],
      ),
      isScrollControlled: true,
    );
  }
}
