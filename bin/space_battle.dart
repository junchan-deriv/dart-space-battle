import 'package:space_battle/battle_field.dart';

void main(List<String> arguments) async {
  final Battlefield field = Battlefield();
  await field.startBattle();
}
