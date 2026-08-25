import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../tool/popup.dart';

class FormBuilderMultiDropdown extends FormBuilderField<String> {
  final double iconSize;

  /// The widget to use for the drop-down button's icon.
  ///
  /// Defaults to an [Icon] with the [Icons.arrow_drop_down] glyph.
  final Widget? icon;

  /// The color of any [Icon] descendant of [icon] if this button is disabled,
  /// i.e. if [onChanged] is null.
  ///
  /// Defaults to [Colors.grey.shade400] when the theme's
  /// [ThemeData.brightness] is [Brightness.light] and to
  /// [Colors.white10] when it is [Brightness.dark]
  final Color? iconDisabledColor;

  /// The color of any [Icon] descendant of [icon] if this button is enabled,
  /// i.e. if [onChanged] is defined.
  ///
  /// Defaults to [Colors.grey.shade700] when the theme's
  /// [ThemeData.brightness] is [Brightness.light] and to
  /// [Colors.white70] when it is [Brightness.dark]
  final Color? iconEnabledColor;

  final Map<String, String> items;
  final Widget? checkBoxIcon;
  final Widget? checkBoxCheckedIcon;
  final Widget? checkBoxDisabledIcon;
  final TextStyle? style;
  final EdgeInsets? popUpLayerPadding;
  final TextStyle? popUpLayerTitleStyle;
  final EdgeInsets? popUpLayerTitlePadding;
  final String? disabledKeys;
  FormBuilderMultiDropdown({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    InputDecoration decoration = const InputDecoration(),
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    this.icon,
    this.iconSize = 24,
    this.iconDisabledColor,
    this.iconEnabledColor,
    required this.items,
    this.checkBoxIcon,
    this.checkBoxCheckedIcon,
    this.checkBoxDisabledIcon,
    this.style,
    this.popUpLayerPadding,
    this.popUpLayerTitleStyle,
    this.popUpLayerTitlePadding,
    this.disabledKeys,
  }) : super(
          builder: (FormFieldState<String?> field) {
            final state = field as _FormBuilderMultiDropdownState;
            //
            String title = '';
            List<String> stateList = state.value?.isNotEmpty ?? false ? state.value!.split(',') : [];
            if (stateList.isNotEmpty) {
              items.forEach((key, value) {
                if (stateList.contains(key)) {
                  if (title.isNotEmpty) {
                    title = '$title, ';
                  }
                  title = title + value;
                }
              });
            }
            //
            if (title.isEmpty) {
              title = 'ALL';
            }
            //
            return InputDecorator(
              decoration: decoration,
              child: GestureDetector(
                onTap: () {
                  showPopup(
                    context: state.context,
                    elevation: 10,
                    shadowColor: Colors.grey,
                    builder: (context) {
                      return Container(
                        width: double.infinity,
                        padding: popUpLayerPadding,
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: items.entries.map(
                              (e) {
                                //
                                FormBuilderMultiDropdownItemStatue statue = FormBuilderMultiDropdownItemStatue.enable;
                                //
                                if (state.value?.isNotEmpty ?? false) {
                                  if (',${state.value},'.contains(',${e.key},')) {
                                    statue = FormBuilderMultiDropdownItemStatue.checked;
                                  }
                                }
                                //
                                if (disabledKeys?.isNotEmpty ?? false) {
                                  if (',$disabledKeys,'.contains(',${e.key},')) {
                                    statue = FormBuilderMultiDropdownItemStatue.disable;
                                  }
                                }
                                return FormBuilderMultiDropdownItem(
                                  value: e.key,
                                  title: e.value,
                                  icon: checkBoxIcon ?? const Icon(Icons.check_box_outline_blank),
                                  checkedIcon: checkBoxCheckedIcon ?? const Icon(Icons.check_box_outlined),
                                  disabledIcon: checkBoxDisabledIcon,
                                  statue: statue,
                                  onTap: (v, isChecked) {
                                    List<String> list = state.value?.isNotEmpty ?? false ? state.value!.split(',') : [];
                                    if (isChecked) {
                                      if (list.contains(v) == false) {
                                        list.add(v);
                                      }
                                    } else {
                                      if (list.contains(v)) {
                                        list.remove(v);
                                      }
                                    }
                                    //
                                    state.setState(() {
                                      state.setValue(list.join(','));
                                      state.didChange(list.join(','));
                                    });
                                  },
                                  titlePadding: popUpLayerTitlePadding,
                                  style: popUpLayerTitleStyle,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      );
                    },
                  );
                },
                behavior: HitTestBehavior.translucent,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          title,
                          style: style,
                          strutStyle: style != null
                              ? StrutStyle(
                                  fontFamily: style.fontFamily,
                                  fontWeight: style.fontWeight,
                                  fontSize: style.fontSize,
                                  leading: 0,
                                  forceStrutHeight: true,
                                  height: 1.3,
                                )
                              : null,
                        ),
                      ),
                    ),
                    icon ??
                        Icon(
                          Icons.arrow_drop_down,
                          size: iconSize,
                          color: enabled ? iconEnabledColor : iconDisabledColor,
                        )
                  ],
                ),
              ),
            );
          },
        );

  @override
  FormBuilderFieldState<FormBuilderMultiDropdown, String> createState() => _FormBuilderMultiDropdownState();
}

class _FormBuilderMultiDropdownState extends FormBuilderFieldState<FormBuilderMultiDropdown, String> {}

enum FormBuilderMultiDropdownItemStatue { enable, checked, disable }

typedef FormBuilderMultiDropdownItemGestureTapCallback = void Function(String value, bool isChecked);

//
class FormBuilderMultiDropdownItem extends StatefulWidget {
  final String value;
  final String title;
  final EdgeInsetsGeometry? titlePadding;
  final FormBuilderMultiDropdownItemStatue statue;
  final FormBuilderMultiDropdownItemGestureTapCallback onTap;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final TextStyle? checkedStyle;
  final TextStyle? disabledStyle;
  final Widget icon;
  final Widget checkedIcon;
  final Widget? disabledIcon;
  const FormBuilderMultiDropdownItem({
    super.key,
    required this.value,
    required this.title,
    this.titlePadding,
    this.statue = FormBuilderMultiDropdownItemStatue.enable,
    required this.onTap,
    this.padding,
    this.style,
    this.checkedStyle,
    this.disabledStyle,
    required this.icon,
    required this.checkedIcon,
    this.disabledIcon,
  });

  @override
  State<FormBuilderMultiDropdownItem> createState() => _FormBuilderMultiDropdownItemState();
}

class _FormBuilderMultiDropdownItemState extends State<FormBuilderMultiDropdownItem> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.statue == FormBuilderMultiDropdownItemStatue.checked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.statue == FormBuilderMultiDropdownItemStatue.disable) {
          return;
        }
        setState(() {
          isChecked = !isChecked;
        });
        widget.onTap.call(widget.value, isChecked);
      },
      child: Container(
        padding: widget.padding,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.statue == FormBuilderMultiDropdownItemStatue.disable
                ? widget.disabledIcon ?? widget.icon
                : isChecked
                    ? widget.checkedIcon
                    : widget.icon,
            Padding(
              padding: widget.titlePadding ?? const EdgeInsets.only(left: 8),
              child: Text(
                widget.title,
                style: widget.statue == FormBuilderMultiDropdownItemStatue.disable
                    ? widget.disabledStyle ?? widget.style
                    : isChecked
                        ? widget.checkedStyle ?? widget.style
                        : widget.style,
              ),
            )
          ],
        ),
      ),
    );
  }
}
