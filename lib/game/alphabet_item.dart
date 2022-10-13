import 'package:flutter/material.dart';
import 'package:memory_game/game/alphabet.dart';

class AlphabetItem extends StatefulWidget {
  Alphabet item;
  AlphabetItem(this.item, {Key? key}) : super(key: key);

  @override
  State<AlphabetItem> createState() => _AlphabetItemState();
}

class _AlphabetItemState extends State<AlphabetItem> {
  @override
  Widget build(BuildContext context) {
    return widget.item.visible
        ? Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            margin: EdgeInsets.all(4),
            padding: EdgeInsets.all(8),
            child: widget.item.tempVisible
                ? Center(
                    child: Text(
                      widget.item.name,
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : Container(color: Colors.red),
          )
        : Container();
  }
}
