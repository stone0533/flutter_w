import 'package:flutter/cupertino.dart';
import 'package:flutter_w/src/get/w.dart';

class GetXRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    //print('Page pushed: ${route.settings.name}');
    WGet.routes.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    //print('Page popped: ${route.settings.name}');
    WGet.routes.removeLast();
  }
}
