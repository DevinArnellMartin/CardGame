import 'package:flutter/material.dart';
import 'card.dart';

class GameProvider with ChangeNotifier {
  List<CardModel> _cards = [];
  CardModel? firstSelectedCard;
  CardModel? secondSelectedCard;
  bool gameOver = false;

  GameProvider() {
    initGame();
  }

  List<CardModel> get cards => _cards;

  void initGame() {
    // Add card pairs (ensure each image appears twice)
    _cards = [
      CardModel(id: '1', img: 'assets/pumpkin.png'),
      CardModel(id: '1', img: 'assets/pumpkin.png'),
      CardModel(id: '2', img: 'assets/ghost.png'),
      CardModel(id: '2', img: 'assets/ghost.png'),
      // Add more pairs of cards
    ];
    _cards.shuffle(); // Shuffle the cards for randomness
    notifyListeners();
  }

  void selectCard(CardModel card) {
    if (firstSelectedCard == null) {
      firstSelectedCard = card;
    } else if (secondSelectedCard == null && card != firstSelectedCard) {
      secondSelectedCard = card;
      _checkMatch();
    }
    notifyListeners();
  }

  void _checkMatch() {
    if (firstSelectedCard!.id == secondSelectedCard!.id) {
      firstSelectedCard = null;
      secondSelectedCard = null;
      _checkGameOver();
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        firstSelectedCard!.revealed = false;
        secondSelectedCard!.revealed = false;
        firstSelectedCard = null;
        secondSelectedCard = null;
        notifyListeners();
      });
    }
  }

  void _checkGameOver() {
    gameOver = _cards.every((card) => card.revealed);
    if (gameOver) {
      // Show victory message
    }
    notifyListeners();
  }
}
