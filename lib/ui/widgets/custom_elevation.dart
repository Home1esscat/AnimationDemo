import 'package:flutter/material.dart';

import '../curves/sine_curve.dart';

class BackgroundElevation extends StatelessWidget {
  final Widget childWidget;
  final AnimationController animationController;

  const BackgroundElevation(
      {super.key,
      required this.childWidget,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return DecoratedBox(
          //Quite expensive operation (bad profiler results)
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                      color: Colors.green.withOpacity(animationController
                          .drive(CurveTween(curve: const SineCurve()))
                          .value),
                      blurRadius: 50)
                  .scale(0.5),
            ],
          ),
          child: child,
        );
      },
      child: childWidget,
    );
  }
}
