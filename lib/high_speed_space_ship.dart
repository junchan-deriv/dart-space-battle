import 'dart:math';

import 'package:space_battle/space_ship.dart';

class HighSpeedSpaceShip extends SpaceShip {
  final Random _random = Random();
  double probabilityToDodge;

  HighSpeedSpaceShip(super.health, super.firePower,[this.probabilityToDodge=0.35]);
  @override
  double determineDamage(double baseDamage) {
    bool dodged = _random.nextDouble() < probabilityToDodge;
    if (dodged) {
      print("Attack dodged!!!!!");
    }
    return dodged ? 0 : baseDamage;
  }
}
