import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class WDropdown<T> extends StatelessWidget {
  final String name;
  final Map<T, String> items;
  final T? initialValue;
  final ValueChanged<T?>? onChanged;
  final TextStyle? labelStyle;
  final Widget? icon;
  final EdgeInsetsGeometry? contentPadding;
  final Decoration? containerDecoration;
  final EdgeInsetsGeometry? containerMargin;
  final EdgeInsetsGeometry? containerPadding;
  final double? width;
  final double? height;
  final Matrix4? transform;
  final Widget? hint;
  final bool enabled;
  const WDropdown({
    super.key,
    required this.name,
    required this.items,
    this.initialValue,
    this.onChanged,
    this.labelStyle,
    this.icon,
    this.contentPadding,
    this.containerDecoration,
    this.containerMargin,
    this.containerPadding,
    this.width,
    this.height,
    this.transform,
    this.hint,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: Alignment.center,
      decoration: containerDecoration,
      margin: containerMargin,
      padding: containerPadding,
      transform: transform, //Matrix4.translationValues(0, -2.w, 0),
      child: FormBuilderDropdown<T>(
        name: name,
        items: items.entries
            .map(
              (e) => DropdownMenuItem<T>(
                value: e.key,
                child: Text(
                  e.value,
                  style: labelStyle,
                  strutStyle: const StrutStyle(forceStrutHeight: true),
                ),
              ),
            )
            .toList(),
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          contentPadding: contentPadding,
        ),
        initialValue: initialValue,
        icon: icon,
        onChanged: onChanged,
        hint: hint,
        enabled: enabled,
      ),
    );
  }

  // factory WDropdown.style1({
  //   required String name,
  //   required Map<T, String> items,
  //   ValueChanged<T?>? onChanged,
  //   T? initialValue,
  //   double? width,
  //   String? hintText,
  //   bool? enabled,
  // }) {
  //   return WDropdown(
  //     name: name,
  //     items: items,
  //     icon: Image.asset(
  //       'assets/images/dropdown.png',
  //       width: 16.w,
  //       fit: BoxFit.fitWidth,
  //     ),
  //     labelStyle: TextStyle(
  //       fontFamily: WFont.NotoSansTC,
  //       fontWeight: FontWeight.w400,
  //       fontSize: 14.sp,
  //       color: Color(0xff183D46),
  //     ),
  //     onChanged: onChanged,
  //     initialValue: initialValue,
  //     contentPadding: EdgeInsets.only(left: 16.w, right: 16.w),
  //     width: width,
  //     height: 40.w,
  //     transform: Matrix4.translationValues(0, -4.w, 0),
  //     hint: hintText?.isEmpty ?? true
  //         ? null
  //         : Container(
  //             child: Text(
  //               hintText!,
  //               style: TextStyle(
  //                 fontFamily: WFont.NotoSansTC,
  //                 fontWeight: FontWeight.w400,
  //                 fontSize: 14.sp,
  //                 color: Color(0xff949494),
  //               ),
  //             ),
  //           ),
  //     enabled: enabled ?? true,
  //   );
  // }
}
