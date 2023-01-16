import 'dart:math' as math;
import 'dart:ui';
import 'package:advanced_widget/theme/theme.dart';
import 'package:advanced_widget/widgets/sheet_appbar.dart';
import 'package:flutter/material.dart';

class SheetAppBar extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  SheetAppBar({super.key});

  @override
  SheetAppBarState createState() => SheetAppBarState();
}

class SheetAppBarState extends State<SheetAppBar>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;

  double get maxHeight => MediaQuery.of(context).size.height / 2;
  double? minHeight = 70;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  double? lerp(double? min, double? max) =>
      lerpDouble(min, max, _controller!.value);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (context, child) {
        return Positioned(
            height: lerp(minHeight, maxHeight),
            left: 0,
            right: 0,
            top: 0,
            child: GestureDetector(
              onTap: _toggle,
              onVerticalDragUpdate: _handleDragUpdate,
              onVerticalDragEnd: _handleDragEnd,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: _controller!.status == AnimationStatus.forward ||
                          _controller!.status == AnimationStatus.completed
                      ? (CustomTheme.isDarkTheme
                          ? CustomTheme.darkTheme.colorScheme.background
                          : CustomTheme.lightTheme.colorScheme.background)
                      : (CustomTheme.isDarkTheme
                          ? CustomTheme.darkTheme.colorScheme.surface
                          : CustomTheme.lightTheme.colorScheme.secondary),
                ),
                duration: const Duration(milliseconds: 300),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Sheet(
                    isVisible: _controller!.status == AnimationStatus.forward ||
                        _controller!.status == AnimationStatus.completed,
                  ),
                ),
              ),
            ));
      },
    );
  }

  void _toggle() {
    final bool isOpen = _controller!.status == AnimationStatus.completed;
    _controller!.fling(velocity: isOpen ? -1 : 1);
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    /* print(" контроллер ${_controller!.value}");
    print("указатель ${details.primaryDelta}"); */
    _controller!.value += details.primaryDelta! / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller!.isAnimating ||
        _controller!.status == AnimationStatus.completed) return;
    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0) {
      _controller!.fling(velocity: math.max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller!.fling(velocity: math.min(-2.0, -flingVelocity));
    } else {
      _controller!.fling(velocity: _controller!.value < 0.5 ? -2.0 : 2.0);
    }
  }
}
