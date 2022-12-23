import 'package:flutter/material.dart';
import 'dart:math';

class SineCurve extends Curve {
  final double count;
  const SineCurve({this.count = 4});

  @override
  double transformInternal(double t) {
    var val = sin(count * 2 * pi * t) * 0.5 + 0.5;
    return val; //f(x)
  }
}
