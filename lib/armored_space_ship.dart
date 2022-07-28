import 'package:space_battle/space_ship.dart';
import 'dart:math';

class ArmoredSpaceShip extends SpaceShip {
  ///
  final Random _random = Random();

  ///
  /// The max armor power in percentage
  ///
  final double maxArmorPower;
  ArmoredSpaceShip(double health, double power, this.maxArmorPower)
      : super(health, power);

  @override
  double determineDamage(double baseDamage) {
    //determine the percentage it reduces
    double percent = _random.nextDouble() * maxArmorPower;
    return baseDamage * (1 - percent);
  }
}
