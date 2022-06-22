import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_game/entities/entity.dart';

import '../utilities/global_vars.dart';

class Asteroid extends Entity {
  double _angle = 0;
  final double _speed = 2;
  static const size = 50;

  Asteroid(bool isBig) : super(isBig ? "asteroidbig" : "asteroidwhite") {
    Random random = Random.secure();
    _angle = random.nextDouble() * 1200;
    if (random.nextBool() == true) {
      y = GlobalVars.screenHeight + size;
    } else {
      y -= size;
    }
    x = random.nextDouble() * GlobalVars.screenWidth;
  }

  @override
  Widget build() {
    return Positioned(
        top: y,
        left: x,
        child: Transform.rotate(angle: _angle, child: sprites[currentSprite]));
  }

  @override
  void move() {
    x += sin(_angle) * _speed;
    y -= cos(_angle) * _speed;
    if (x > GlobalVars.screenWidth ||
        y > GlobalVars.screenHeight + size ||
        x < 0 - size ||
        y < 0 - size) {
      visible = false;
    }
  }
}
