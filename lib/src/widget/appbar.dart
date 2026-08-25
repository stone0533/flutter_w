import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_w/w.dart';
import 'package:get/get.dart';

class WAppbar extends StatefulWidget {
  final String? title;
  final Widget? titleWidget;
  final bool? hideBackIcon;
  final Widget? rightMenuWidget;
  final Color? backgroundColor;
  const WAppbar({
    super.key,
    this.title,
    this.titleWidget,
    this.hideBackIcon,
    this.rightMenuWidget,
    this.backgroundColor,
  });

  @override
  State<WAppbar> createState() => _WAppbarState();
}

class _WAppbarState extends State<WAppbar> {
  WAppbarConfig config = WAppbarConfig.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight),
      color: widget.backgroundColor ?? config.backgroundColor,
      child: Stack(
        children: [
          Container(
            height: config.height,
            alignment: Alignment.center,
            padding: config.titlePadding,
            child: Text(
              widget.title ?? '',
              style: config.titleStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned.fill(
            child: Container(
              alignment: Alignment.center,
              child: widget.titleWidget,
            ),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                widget.hideBackIcon == true
                    ? Container()
                    : WButtonClickEffect(
                        onTap: () {
                          Get.back();
                        },
                        child: config.backIcon ?? Container(),
                      ),
                widget.rightMenuWidget ?? Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WAppbarConfig {
  Color? backgroundColor;
  TextStyle? titleStyle;
  double? height;
  EdgeInsetsGeometry? titlePadding;
  Widget? backIcon;
  //
  static final WAppbarConfig _instance = WAppbarConfig._internal();
  WAppbarConfig._internal() {
    /// set deafult value
  }

  static WAppbarConfig get instance => _instance;
}
