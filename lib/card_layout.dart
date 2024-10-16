import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'card.dart';
import 'game.dart';


class CardWidget extends StatelessWidget {
  final CardModel card;
  const CardWidget({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!card.revealed) {
          card.revealed = true;
          Provider.of<GP>(context, listen: false).selectCard(card);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 420),
        child: card.revealed
            ? Image.asset(card.img)
            : Container(
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    '???',
                    style: TextStyle(fontSize: 42, color: Colors.black),
                  ),
                ),
              ),
      ),
    );
  }
}
