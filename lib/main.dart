import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game.dart';
import 'card_layout.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GP(),
      child: const CardGame(),
    ),
  );
}

class CardGame extends StatelessWidget {
  const CardGame({super.key});

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
  const CardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<GP>(
      builder: (context, GP, child) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemCount: GP.cards.length,
          itemBuilder: (context, indx) {
            final card = GP.cards[indx];
            return CardWidget(card: card);
          },
        );
      },
    );
  }
}

