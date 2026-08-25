import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class WFormBuilderButton<T> extends FormBuilderField<T> {
  final Widget Function()? hintWidgetBuilder;
  final Widget Function(T value)? selectedWidgetBuilder;
  final void Function(T? value, ValueChanged<T> didChange) onTap;

  WFormBuilderButton({
    super.key,
    required super.name,
    super.validator,
    super.initialValue,
    super.onChanged,
    super.valueTransformer,
    super.enabled,
    super.onSaved,
    super.autovalidateMode = AutovalidateMode.disabled,
    super.onReset,
    super.focusNode,
    super.restorationId,
    this.hintWidgetBuilder,
    this.selectedWidgetBuilder,
    required this.onTap,
  }) : super(
          builder: (FormFieldState<T?> field) {
            //
            final state = field as _WFormBuilderButtonState;
            //
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                onTap.call(state.value, (a) {
                  state.setState(() {
                    state.setValue(a);
                  });
                  state.didChange(state.value);
                });
              },
              child: Builder(
                builder: (_) {
                  if (state.value == null) {
                    return hintWidgetBuilder?.call() ?? Container();
                  }
                  return (selectedWidgetBuilder?.call(state.value!) ?? Container());
                },
              ),
            );
          },
        );

  @override
  FormBuilderFieldState<WFormBuilderButton<T>, T> createState() => _WFormBuilderButtonState();
}

class _WFormBuilderButtonState<T> extends FormBuilderFieldState<WFormBuilderButton<T>, T> {}
