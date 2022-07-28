import 'dart:math';
import 'dart:io';

import 'package:space_battle/armored_space_ship.dart';
import 'package:space_battle/high_speed_space_ship.dart';
import 'package:space_battle/space_ship.dart';

class Battlefield {
  final Random _random = Random();
  late List<SpaceShip> _ships;
  Battlefield() {
    _ships = List.generate(2, (_) {
      if (_random.nextBool()) {
        //if true then construct the high speed
        return HighSpeedSpaceShip(
            _random.nextDouble() * 100 + 100, _random.nextDouble() * 40 + 10,
            _random.nextDouble()*0.40);
      } else {
        return ArmoredSpaceShip(_random.nextDouble() * 100 + 100,
            _random.nextDouble() * 40 + 10, _random.nextDouble() * 0.4);
      }
    });
  }
  void _sleep() {
    // await Future.delayed(Duration(seconds: 2));
    print("Press any key to continue");
    stdin.readLineSync();
  }

  void dumpStatus() {
    int idx = 1;
    for (final SpaceShip ship in _ships) {
      print("#$idx $ship");
      idx++;
    }
  }

  Future<void> startBattle() async {
    //select which one to start
    int startingIdx = _random.nextInt(2);
    SpaceShip lhs = _ships[startingIdx];
    SpaceShip rhs = _ships[(startingIdx+1)%2];
    //select it and then hit others until one is destroyed
    print("Initial status");
    dumpStatus();
    while (!_ships.any((element) => element.isDestroyed())) {
      print("Ship ${startingIdx + 1} performed its attack!!!!!!");
      rhs.hit(lhs);
      print("Current status");
      dumpStatus();
      if (!_ships.any((element) => element.isDestroyed())) _sleep();
      //swap its pointers
      startingIdx = (startingIdx + 1) % 2;
      lhs = _ships[startingIdx];
      rhs = _ships[(startingIdx + 1) % 2];
    }
    print("Game ended");
    for (int i = 0; i < 2; i++) {
      final SpaceShip ship = _ships[i];
      if (!ship.isDestroyed()) {
        print("Ship ${i + 1} is winner");
      }
    }
  }
}
