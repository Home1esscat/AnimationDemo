import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final AnimationController controller;
  final bool isLocked;
  final Color backgroundColor;

  const CustomChip({
    super.key,
    required this.isLocked,
    required this.backgroundColor,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 30,
      child: isLocked ? customClipStaticLocked() : customClipInteractive(),
    );
  }

  Widget customClipStaticLocked() {
    return SizedBox(
      width: 50,
      height: 30,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.pink,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Icon(Icons.lock),
      ),
    );
  }

  Widget customClipInteractive() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(children: [
        const Center(child: Text('6-0')),
        ScaleTransition(
          scale: controller.drive(CurveTween(curve: Curves.elasticOut)),
          child: SizedBox(
            width: 50,
            height: 30,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Center(child: Text('6-3')),
            ),
          ),
        ),
      ]),
    );
  }
}
