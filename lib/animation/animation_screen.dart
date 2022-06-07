import 'package:flutter/material.dart';
import 'package:loader_animation/animation/raindropanimation.dart';
import '../module/drop_painter.dart';
import '../module/hole_painter.dart';

class AnimationScreen extends StatefulWidget {
  final Color color;
  const AnimationScreen({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  Size size = Size.zero;
  late AnimationController _controller;
  late RaindropAnimation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = RaindropAnimation(_controller);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      size = MediaQuery.of(context).size;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: HolePainter(
              color: widget.color,
              holeSize: _animation.holeSize.value * size.width,
            ),
          ),
        ),
        Positioned(
          top: _animation.dropPosition.value * size.height,
          left: size.width / 2 - _animation.dropSize.value / 2,
          child: SizedBox( 
            width: _animation.dropSize.value,
            height: _animation.dropSize.value,
            child: CustomPaint(
              painter: DropPainter(
                visible: _animation.dropVisible.value,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Opacity(
              opacity: _animation.textOpacity.value,
              child: const Text(
                'Simple Animation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
