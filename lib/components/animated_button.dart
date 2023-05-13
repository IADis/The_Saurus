// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  const AnimatedButton({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation =
        Tween<double>(end: 1.1, begin: 0.9).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        onTapDown: widget.onTap != null
            ? (_) {
                _animationController.forward();
              }
            : null,
        onTapUp: widget.onTap != null
            ? (_) {
                _animationController.reverse();
              }
            : null,
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (_, __) {
            return Transform.scale(
              scale: _animation.value,
              child: widget.child,
            );
          },
        ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
