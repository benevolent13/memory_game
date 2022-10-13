import 'package:memory_game/game/alphabet.dart';

abstract class GameState{}

class InitGameState extends GameState{}

class ListGameState extends GameState{
  List<Alphabet> list;
  String attempt;
  ListGameState(this.list,this.attempt);
}