import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game.dart';
import 'card.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GameProvider(),
      child: const CardGame(),
    ),
  );
}

class CardGame extends StatelessWidget {
  const CardGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Spoopy Card Game')),
        body: const CardGrid(),
      ),
    );
  }
}

class CardGrid extends StatelessWidget {
  const CardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(
      builder: (context, gameProvider, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: gameProvider.cards.length,
          itemBuilder: (context, index) {
            final card = gameProvider.cards[index];
            return CardWidget(card: card);
          },
        );
      },
    );
  }
}

