import 'package:flutter/material.dart';
import 'card.dart';

class GP with ChangeNotifier {
  List<CardModel> alias_cards_ = [];
  CardModel? firstSelection;
  CardModel? secondSelection;
  bool gameOver = false;

  GP() {
    initGame();
  }

  List<CardModel> get cards => alias_cards_;

  void initGame() {
    alias_cards_ = [
      CardModel(id: '1', img: 'images/pumpkin.png'),
      CardModel(id: '1', img: 'images/pumpkin.png'),
      CardModel(id: '2', img: 'images/ghost.png'),
      CardModel(id: '2', img: 'images/ghost.png'),
    ];
    alias_cards_.shuffle();
    notifyListeners();
  }

  void selectCard(CardModel card) {
    if (firstSelection == null) {
      firstSelection = card;
    } else if (secondSelection == null && card != firstSelection) {
      secondSelection = card;
      isMatch();
    }
    notifyListeners();
  }

  void isMatch() {
    if (firstSelection!.id == secondSelection!.id) {
      firstSelection = null;
      secondSelection = null;
      endGame();
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        firstSelection!.revealed = false;
        secondSelection!.revealed = false;
        secondSelection = null;
        firstSelection = null;

        notifyListeners();
      });
    }
  }

  void endGame() {
    gameOver = alias_cards_.every((card) => card.revealed);
    if (gameOver) {
      notifyListeners(); 
    }
  }
}
