import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../w.dart';

class WApp {
  static void init() {
    if (Platform.isAndroid) {
      // 设置android状态栏为透明色
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //状态栏颜色设置为透明
          statusBarBrightness: Brightness.dark, //状态栏字体颜色设置为深色
          systemNavigationBarColor: Colors.black, //底部导航栏颜色设置为黑色
          systemNavigationBarIconBrightness: Brightness.light, //底部导航栏图标颜色设置为浅色
        ),
      );
    }
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  static void run(
    double width, {
    String title = '',
    String? initialRoute,
    List<GetPage<dynamic>>? getPages,
    VoidCallback? configInit,
    TransitionBuilder? builder,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
  }) {
    runApp(
      ScreenUtilInit(
        designSize: Size(width, 0),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          configInit?.call();
          return GetMaterialApp(
            title: title,
            initialRoute: initialRoute,
            getPages: getPages,
            debugShowCheckedModeBanner: false,
            builder: builder,
            navigatorObservers: [...navigatorObservers, GetXRouterObserver()],
            //translations: TranslationsService(),
            //locale: localInit,
            //fallbackLocale: localInit,
            defaultTransition: Transition.topLevel,
            theme: ThemeData(primaryColor: const Color(0xff4C6374)),
          );
        },
      ),
    );
  }
}
