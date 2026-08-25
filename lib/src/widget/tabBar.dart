import 'package:flutter/material.dart';

class WTabBar extends StatefulWidget {
  final WTabBarConfig config;
  final List<Widget> tabs;
  final TabController? controller;
  final void Function(int)? onTap;
  const WTabBar({
    super.key,
    required this.config,
    required this.tabs,
    this.controller,
    this.onTap,
  });

  @override
  State<WTabBar> createState() => _WTabBarState();
}

class _WTabBarState extends State<WTabBar> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.controller,
      padding: widget.config._padding,
      isScrollable: widget.config._isScrollable,
      tabs: widget.tabs,
      labelStyle: widget.config._labelStyle,
      unselectedLabelStyle: widget.config._unselectedLabelStyle,
      indicatorSize: widget.config._indicatorSize,
      indicatorColor: widget.config._indicatorColor,
      indicator: widget.config._indicator,
      indicatorWeight: widget.config._indicatorWeight,
      dividerColor: widget.config._dividerColor,
      dividerHeight: widget.config._dividerHeight,
      physics: const NeverScrollableScrollPhysics(),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      tabAlignment: widget.config._tabAlignment,
      onTap: widget.onTap,
    );
  }
}

class WTabBarConfig {
  TextStyle? _labelStyle;
  TextStyle? _unselectedLabelStyle;

  Color? _dividerColor;
  double? _dividerHeight;
  EdgeInsetsGeometry? _padding;
  bool _isScrollable = false;
  TabBarIndicatorSize? _indicatorSize;
  Color? _indicatorColor;
  Decoration? _indicator;
  double _indicatorWeight = 2.0;
  TabAlignment? _tabAlignment;

  WTabBarConfig labelStyle(TextStyle labelStyle) {
    _labelStyle = labelStyle;
    return this;
  }

  WTabBarConfig unselectedLabelStyle(TextStyle unselectedLabelStyle) {
    _unselectedLabelStyle = unselectedLabelStyle;
    return this;
  }

  WTabBarConfig divider(double dividerHeight, Color dividerColor) {
    _dividerHeight = dividerHeight;
    _dividerColor = dividerColor;
    return this;
  }

  WTabBarConfig padding(EdgeInsetsGeometry padding) {
    _padding = padding;
    return this;
  }

  WTabBarConfig isScrollable() {
    _isScrollable = true;
    return this;
  }

  WTabBarConfig indicatorSize(TabBarIndicatorSize indicatorSize) {
    _indicatorSize = indicatorSize;
    return this;
  }

  WTabBarConfig indicatorColor(Color indicatorColor) {
    _indicatorColor = indicatorColor;
    return this;
  }

  WTabBarConfig indicator(Decoration indicator) {
    _indicator = indicator;
    return this;
  }

  WTabBarConfig indicatorWithHeightAndColor(double height, Color color) {
    _indicator = BoxDecoration(
      borderRadius: BorderRadius.zero,
      border: Border(bottom: BorderSide(width: height, color: color)),
    );
    return this;
  }

  WTabBarConfig indicatorWeight(double indicatorWeight) {
    _indicatorWeight = indicatorWeight;
    return this;
  }

  WTabBarConfig tabAlignment(TabAlignment tabAlignment) {
    _tabAlignment = tabAlignment;
    return this;
  }
}
