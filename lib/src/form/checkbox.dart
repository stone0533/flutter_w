import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Single Checkbox field
class WFormBuilderCheckbox extends FormBuilderField<bool> {
  final bool shouldRequestFocus;
  final Widget title;
  final WFormBuilderCheckboxConfig config;

  /// Creates a single Checkbox field
  WFormBuilderCheckbox({
    //From Super
    Key? key,
    required String name,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
    required this.title,
    ValueChanged<bool?>? onChanged,
    ValueTransformer<bool?>? valueTransformer,
    bool enabled = true,
    FormFieldSetter<bool?>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    this.shouldRequestFocus = false,
    required this.config,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          valueTransformer: valueTransformer,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          focusNode: focusNode,
          builder: (FormFieldState<bool?> field) {
            //
            final state = field as _WFormBuilderCheckboxState;
            //
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    state.setState(() {
                      if (state.value != null) {
                        var v = state.value == false;
                        state.setValue(v);
                        state.didChange(v);
                      }
                    });
                  },
                  child: Container(
                    transform: Matrix4.translationValues(0, config.iconOffset ?? 0, 0),
                    child: Builder(builder: (_) {
                      if (state.value == true) {
                        return config.checkedIcon;
                      }
                      return config.icon;
                    }),
                  ),
                ),
                SizedBox(width: config.space ?? 0),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      state.setState(() {
                        if (state.value != null) {
                          var v = state.value == false;
                          state.setValue(v);
                          state.didChange(v);
                        }
                      });
                    },
                    child: title,
                  ),
                )
              ],
            );
          },
        );

  @override
  FormBuilderFieldState<WFormBuilderCheckbox, bool> createState() => _WFormBuilderCheckboxState();
}

class _WFormBuilderCheckboxState extends FormBuilderFieldState<WFormBuilderCheckbox, bool> {}

class WFormBuilderCheckboxConfig {
  Widget icon;
  Widget checkedIcon;
  Widget? errorIcon;
  double? space;
  double? iconOffset;
  WFormBuilderCheckboxConfig({
    required this.icon,
    required this.checkedIcon,
    this.errorIcon,
    this.space,
    this.iconOffset,
  });
}
