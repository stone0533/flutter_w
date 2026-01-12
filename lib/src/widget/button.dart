import 'package:flutter/material.dart';

class WButtonClickEffect extends StatefulWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  const WButtonClickEffect({super.key, this.onTap, required this.child});

  @override
  State<WButtonClickEffect> createState() => _WButtonClickEffectState();
}

class _WButtonClickEffectState extends State<WButtonClickEffect> {
  bool isOnTap = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        setState(() {
          isOnTap = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          isOnTap = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isOnTap = false;
        });
      },
      child: Opacity(
        opacity: isOnTap ? 0.9 : 1,
        child: widget.child,
      ),
    );
  }
}
