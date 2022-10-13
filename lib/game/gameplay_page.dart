import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/game/alphabet.dart';
import 'package:memory_game/game/alphabet_item.dart';
import 'package:memory_game/game/cubit/game_cubit.dart';
import 'package:memory_game/game/cubit/game_state.dart';

class GamePlayPage extends StatefulWidget {
  const GamePlayPage({Key? key}) : super(key: key);

  @override
  State<GamePlayPage> createState() => _GamePlayPageState();
}

class _GamePlayPageState extends State<GamePlayPage> {
  GameCubit gameCubit = GameCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder(
      bloc: gameCubit,
      builder: (BuildContext context, state) {
        if (state is ListGameState) {
          return Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(8),
                  child: Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (_, index) {
                        return InkWell(
                            onTap: () {
                              gameCubit.onAlphabetTap(index);
                            },
                            child: AlphabetItem(state.list[index]));
                      },
                      itemCount: state.list.length,
                    ),
                  )),
              Center(
                child: Text("Attempt : " + state.attempt.toString(),
                    style: TextStyle(fontSize: 18)),
              )
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}
