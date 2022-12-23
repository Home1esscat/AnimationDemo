import 'package:flutter/material.dart';

class CustomPopupCircles extends StatelessWidget {
  final Animation<double> firstCircleRadius;
  final Animation<double> secondCircleRadius;
  final Animation<double> thirdCircleRadius;
  final Animation<double> fourthCircleRadius;
  final Animation<double> fifthCircleRadius;

  final Animation<double> controller;

  CustomPopupCircles({super.key, required this.controller})
      : firstCircleRadius = Tween<double>(begin: 0.0, end: 14.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.200, curve: Curves.elasticOut),
          ),
        ),
        secondCircleRadius = Tween<double>(begin: 0.0, end: 14.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.200, 0.400, curve: Curves.elasticOut),
          ),
        ),
        thirdCircleRadius = Tween<double>(begin: 0.0, end: 14.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.400, 0.600, curve: Curves.elasticOut),
          ),
        ),
        fourthCircleRadius = Tween<double>(begin: 0.0, end: 14.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.600, 0.800, curve: Curves.elasticOut),
          ),
        ),
        fifthCircleRadius = Tween<double>(begin: 0.0, end: 14.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.800, 1.0, curve: Curves.elasticOut),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: firstCircleRadius.value,
                height: firstCircleRadius.value,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: secondCircleRadius.value,
                height: secondCircleRadius.value,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: thirdCircleRadius.value,
                height: thirdCircleRadius.value,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: fourthCircleRadius.value,
                height: fourthCircleRadius.value,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Container(
                width: fifthCircleRadius.value,
                height: fifthCircleRadius.value,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
              ),
            ),
          ],
        );
      },
    );
  }
}
