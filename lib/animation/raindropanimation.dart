import 'package:flutter/animation.dart';

class RaindropAnimation {
  final AnimationController controller;
  late final Animation<double> dropSize;
  late final Animation<double> dropPosition;
  late final Animation<bool> dropVisible;
  late final Animation<double> holeSize;
  late final Animation<double> textOpacity;

  static const double maximumDropSize = 20;
  static const double maximumRelativDropY = 0.5;
  static const double maximumHoleSize = 10;

  RaindropAnimation(this.controller) {
    dropSize = Tween<double>(begin: 0, end: maximumDropSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.2, curve: Curves.easeIn),
      ),
    );
    dropPosition = Tween<double>(begin: 0, end: maximumRelativDropY).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.5, curve: Curves.easeIn),
      ),
    );
    holeSize = Tween<double>(begin: 0, end: maximumHoleSize).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      ),
    );
    dropVisible = Tween<bool>(begin: true, end: false).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.5, curve: Curves.easeIn),
      ),
    );
    textOpacity = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.7, curve: Curves.easeOut),
      ),
    );
  }
}
