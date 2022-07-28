import 'dart:math' as Math;

abstract class SpaceShip {
  double health;
  final double firePower;
  SpaceShip(this.health, this.firePower);

  ///is the ship destoried
  bool isDestroyed() => health <= 0;

  ///
  ///Called when it got hit by another ship
  ///
  void hit(SpaceShip another) {
    if (another.isDestroyed() || isDestroyed()) {
      return;
    }
    //get the damage
    double damage = determineDamage(another.firePower);
    health = Math.max(0, health - damage);
  }

  double determineDamage(double baseDamage);

  @override
  String toString() {
    return "Spaceship variant ${runtimeType.toString()}, health=${health.toStringAsFixed((2))} , power=${firePower.toStringAsFixed(2)}";
  }
}
