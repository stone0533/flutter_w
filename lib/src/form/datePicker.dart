import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

class FormBuilderDatePicker extends FormBuilderField<String> {
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

  final TextStyle? style;
  final DateTime firstDate;
  final DateTime lastDate;
  FormBuilderDatePicker({
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
    this.style,
    required this.firstDate,
    required this.lastDate,
  }) : super(
          builder: (FormFieldState<String?> field) {
            final state = field as _FormBuilderDatePickerState;
            //
            String title = '';
            if (state.value?.isNotEmpty ?? false) {
              DateTime _date = DateFormat.yMEd().parse(state.value!);
              var formatter = DateFormat.yMMMMd('en_US');
              title = formatter.format(_date);
            }
            //
            return InputDecorator(
              decoration: decoration,
              child: GestureDetector(
                onTap: () {
                  DateTime? initDate;
                  if (state.value?.isNotEmpty ?? false) {
                    initDate = DateFormat.yMEd().parse(state.value!);
                  }
                  showDatePicker(
                    context: state.context,
                    firstDate: firstDate,
                    lastDate: lastDate,
                    initialDate: initDate,
                  ).then((value) {
                    state.setState(() {
                      if (value == null) {
                        state.setValue(null);
                      } else {
                        var formatter = DateFormat.yMEd();
                        String formatted = formatter.format(value);
                        print(formatted);
                        state.setValue(formatted);
                      }
                    });
                  });
                },
                behavior: HitTestBehavior.translucent,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          title,
                          style: style,
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
  FormBuilderFieldState<FormBuilderDatePicker, String> createState() => _FormBuilderDatePickerState();
}

class _FormBuilderDatePickerState extends FormBuilderFieldState<FormBuilderDatePicker, String> {}
