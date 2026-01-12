import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WScaffold extends StatelessWidget {
  final Widget? body;
  final Color? backgroundColor;
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  const WScaffold({super.key, this.body, this.backgroundColor, this.systemUiOverlayStyle});

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
    if (systemUiOverlayStyle != null) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: systemUiOverlayStyle!,
        child: scaffold,
      );
    } else {
      return scaffold;
    }
  }
}
