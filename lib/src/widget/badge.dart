import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class WBadge extends StatelessWidget {
  final WBadgeConfig config;
  final Widget? badgeContent;
  final Widget? child;

  const WBadge({super.key, required this.config, this.badgeContent, this.child});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      showBadge: config._showBadge,
      position: config._position,
      badgeStyle: const badges.BadgeStyle(
        padding: EdgeInsets.zero,
        borderSide: BorderSide(color: Colors.transparent, width: 0),
        badgeColor: Colors.transparent,
      ),
      badgeContent: badgeContent,
      badgeAnimation: const badges.BadgeAnimation.fade(animationDuration: Duration(milliseconds: 0)),
      child: child,
    );
  }
}

class WBadgeConfig {
  badges.BadgePosition? _position;
  bool _showBadge = true;

  WBadgeConfig position({double? start, double? end, double? top, double? bottom, bool isCenter = false}) {
    _position = badges.BadgePosition.custom(start: start, end: end, top: top, bottom: bottom, isCenter: isCenter);
    return this;
  }

  WBadgeConfig positionTopRight(double top, double right) {
    _position = badges.BadgePosition.topEnd(top: top, end: right);
    return this;
  }

  WBadgeConfig positionCenter() {
    _position = badges.BadgePosition.center();
    return this;
  }

  WBadgeConfig hideBadge() {
    _showBadge = false;
    return this;
  }
}
