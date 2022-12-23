import 'package:flutter/material.dart';

class CustomDigitContainer extends StatelessWidget {
  final Animation<double> controller;
  final Animation<double> offset;
  final Animation<double> opacity;

  CustomDigitContainer({super.key, required this.controller})
      : offset = Tween<double>(
          begin: 0.0,
          end: 50.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.400,
              1.0,
              curve: Curves.easeOutQuart,
            ),
          ),
        ),
        opacity = Tween<double>(
          begin: 1.0,
          end: 0.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(
              0.500,
              1.0,
              curve: Curves.ease,
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.transparent,
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: Text(
              '2',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          ),
        ),
        const SizedBox(width: 2),
        AnimatedBuilder(
          animation: controller,
          builder: _buildAnimatedDigitBox,
        ),
      ],
    );
  }

  Widget _buildAnimatedDigitBox(context, child) {
    return Stack(children: [
      Opacity(
          opacity: opacity.value,
          //First padding for movement,second padding for beauty
          child: Padding(
              padding: EdgeInsets.only(left: offset.value),
              child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: const Center(
                          child: Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Text('+1',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18)))))))),
      Padding(
          padding: const EdgeInsets.all(2.0),
          child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: const Center(
                  child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('8',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: 18)))))),
      ScaleTransition(
          scale: controller.drive(CurveTween(curve: Curves.elasticInOut)),
          child: Padding(
              padding: const EdgeInsets.all(2),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  child: const Center(
                      child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text('9',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18)))))))
    ]);
  }
}
