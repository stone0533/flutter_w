import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../w.dart';

class WFormBuilderBorder extends StatefulWidget {
  const WFormBuilderBorder({
    super.key,
    required this.child,
    this.hintStrList,
    this.readOnly,
    this.transparentBackground,
  });
  final Widget child;
  final List<String>? hintStrList;
  final bool? readOnly;
  final bool? transparentBackground;

  @override
  State<WFormBuilderBorder> createState() => WFormBuilderBorderState();
}

class WFormBuilderBorderState extends State<WFormBuilderBorder> {
  WFormBuilderBorderConfig config = WFormBuilderBorderConfig.instance;
  bool isError = false;
  List<String>? list;
  //
  void setError(bool value, {List<String>? errorStrList}) {
    if (isError != value) {
      setState(() {
        isError = value;
      });
    }
    setState(() {
      if (isError) {
        list = errorStrList;
      } else {
        list = widget.hintStrList;
      }
    });
  }

  @override
  void initState() {
    list = widget.hintStrList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: widget.transparentBackground == true
              ? null
              : isError
                  ? config.errorDecoration
                  : widget.readOnly == true
                      ? config.readOnlyDecoration
                      : config.defaultDecoration,
          child: widget.child,
        ),
        Builder(
          builder: (_) {
            if (list?.isEmpty ?? true) {
              return Container();
            }
            return Container(
              padding: EdgeInsets.symmetric(vertical: 4.w),
              child: Wrap(
                runSpacing: 2.w,
                children: [
                  ...?list?.map((a) {
                    return Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              a,
                              style: isError ? config.errorStyle : config.hintStyle,
                            ),
                          )
                        ],
                      ),
                    );
                  })
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class WFormBuilderBorderConfig {
  late Decoration defaultDecoration;
  late Decoration readOnlyDecoration;
  late Decoration errorDecoration;
  late TextStyle hintStyle;
  late TextStyle errorStyle;
  //
  static final WFormBuilderBorderConfig _instance = WFormBuilderBorderConfig._internal();
  WFormBuilderBorderConfig._internal() {
    /// set deafult value
    defaultDecoration = BoxDecoration(
      border: Border.all(width: 1.w, color: HexColor.fromHex('#EAEAEA')),
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.w)),
    );
    readOnlyDecoration = BoxDecoration(
      border: Border.all(width: 1.w, color: HexColor.fromHex('#EAEAEA')),
      color: HexColor.fromHex('#F5F5F5'),
      borderRadius: BorderRadius.all(Radius.circular(20.w)),
    );
    errorDecoration = BoxDecoration(
      border: Border.all(width: 1.w, color: HexColor.fromHex('#C0061A')),
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(20.w)),
    );
    errorStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: HexColor.fromHex('#C0061A'),
    );
    hintStyle = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12.sp,
      color: HexColor.fromHex('#3F3F3F'),
    );
  }

  static WFormBuilderBorderConfig get instance => _instance;
}
