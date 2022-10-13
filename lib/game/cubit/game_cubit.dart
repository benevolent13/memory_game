import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/game/alphabet.dart';
import 'package:memory_game/game/cubit/game_state.dart';

class GameCubit extends Cubit<GameState> {
  final List<Alphabet> alphaList = [
    Alphabet("A", true, false),
    Alphabet("B", true, false),
    Alphabet("C", true, false),
    Alphabet("D", true, false),
    Alphabet("E", true, false),
    Alphabet("F", true, false),
    Alphabet("G", true, false),
    Alphabet("H", true, false),
    Alphabet("A", true, false),
    Alphabet("B", true, false),
    Alphabet("C", true, false),
    Alphabet("D", true, false),
    Alphabet("E", true, false),
    Alphabet("F", true, false),
    Alphabet("G", true, false),
    Alphabet("H", true, false),
  ];
  GameCubit() : super(InitGameState()) {
    passAlphaList();
  }

  int tap = 1;
  int attempt = 0;
  int tempIndex = 0;
  String char = "";

  void passAlphaList() {
    alphaList.shuffle();
    emit(ListGameState(alphaList,attempt.toString()));
  }

  void onAlphabetTap(int index) {
    if (tap > 2) {
      tap = 1;
      attempt = attempt + 1;
      alphaList.forEach((element) {
        element.tempVisible = false;
      });
      alphaList[index].tempVisible = true;
      char = alphaList[index].name;
      tempIndex = index;
      tap = tap + 1;
    } else {
      alphaList[index].tempVisible = true;
      if (tap == 2) {
        print(char);
        print(alphaList[index].name);
        if (char == alphaList[index].name && tempIndex != index) {
          alphaList[index].visible = false;
          alphaList[tempIndex].visible = false;
        }
      }
      char = alphaList[index].name;
      tempIndex = index;
      tap = tap + 1;
    }
    emit(ListGameState(alphaList,attempt.toString()));
  }
}
