import 'package:flutter/material.dart';

class WStep extends StatelessWidget {
  final int step;
  final int count;
  final Widget Function(Widget child) backgroundBuilder;
  final Widget Function(int index, int current) itemBuilder;
  final Widget Function(int index, int current) dividerBuilder;
  const WStep({
    super.key,
    this.step = 1,
    this.count = 3,
    required this.backgroundBuilder,
    required this.itemBuilder,
    required this.dividerBuilder,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < count; i++) {
      children.add(buildItem(i + 1));
      if (i + 1 < count) {
        children.add(Expanded(child: buildLine(i + 2)));
      }
    }
    return backgroundBuilder(
      Row(
        children: children,
      ),
    );
  }

  Widget buildLine(int index) {
    return dividerBuilder(index, step);
  }

  Widget buildItem(int index) {
    return itemBuilder(index, step);
  }
}
