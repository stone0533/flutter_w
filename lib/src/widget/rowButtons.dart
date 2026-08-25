import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WRowButtons extends StatefulWidget {
  const WRowButtons({
    super.key,
    required this.controller,
    required this.builder,
    this.padding,
    this.onTap,
    this.onCanTop,
    this.spacing = 0.0,
  });

  final Widget Function(BuildContext context, int index, bool isSelected) builder;
  final EdgeInsetsGeometry? padding;
  final ValueChanged<int>? onTap;
  final WRowButtonsController controller;
  final bool Function(int index)? onCanTop;
  final double spacing;

  @override
  State<WRowButtons> createState() => _WRowButtonsState();
}

class _WRowButtonsState extends State<WRowButtons> {
  late ScrollController scrollController;
  late int currentIndex;
  @override
  void initState() {
    scrollController = widget.controller.scrollController;
    currentIndex = widget.controller.index;
    super.initState();
    widget.controller._state = this;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints boxConstraints) {
        widget.controller.boxConstraints = boxConstraints;
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: scrollController,
          child: Container(
            padding: widget.padding,
            child: Wrap(
              spacing: widget.spacing,
              children: List.generate(
                widget.controller.length,
                (index) => GestureDetector(
                  key: widget.controller._keys[index],
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (widget.onCanTop?.call(index) == false) {
                      return;
                    }
                    widget.onTap?.call(index);
                    widget.controller.animateTo(index);
                  },
                  child: widget.builder(context, index, currentIndex == index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class WRowButtonsController {
  final int length;
  int index;
  //
  late Map<int, GlobalKey> _keys;
  _WRowButtonsState? _state;
  //
  BoxConstraints? boxConstraints;
  late ScrollController scrollController;
  Duration? animationDuration;
  bool scrollToCenter;

  WRowButtonsController({
    required this.length,
    int initialIndex = 0,
    this.animationDuration,
    this.scrollToCenter = true,
  }) : index = initialIndex {
    _keys = {};
    for (int i = 0; i < length; i++) {
      _keys[i] = GlobalKey();
    }
    scrollController = ScrollController();
    animationDuration = const Duration(milliseconds: 600);
  }

  void _changeIndex(int value, {Duration? duration, Curve curve = Curves.ease}) {
    if (boxConstraints == null) {
      return;
    }
    index = value;
    if (_state != null) {
      _state!.setState(() {
        _state!.currentIndex = index;
      });
    }
    if (scrollToCenter == false) {
      return;
    }
    RenderObject? evaluationRenderObject = _keys[index]?.currentContext?.findRenderObject();
    final translation = evaluationRenderObject?.getTransformTo(null).getTranslation();
    final size = evaluationRenderObject?.semanticBounds.size;
    if (translation != null && size != null) {
      var x = translation.x - (boxConstraints!.maxWidth - size.width) / 2;
      //
      var xx = x + scrollController.offset;
      if ((translation.x + scrollController.offset + (size.width / 2)) < 0.5.sw) {
        xx = scrollController.position.minScrollExtent;
      } else if (translation.x +
              scrollController.offset +
              (size.width / 2) -
              scrollController.position.maxScrollExtent >
          0.5.sw) {
        xx = scrollController.position.maxScrollExtent;
      }
      if (duration == null || duration <= Duration.zero) {
        scrollController.jumpTo(xx);
      } else {
        scrollController.animateTo(xx, duration: duration, curve: curve);
      }
    }
  }

  void animateTo(int value, {Curve curve = Curves.ease}) {
    _changeIndex(value, duration: animationDuration, curve: curve);
  }

  void jumpTo(int value) {
    _changeIndex(value);
  }
}
