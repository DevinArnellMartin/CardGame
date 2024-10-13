import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'game.dart'; 

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gameProvider = Provider.of<GP>(context); 

    return Scaffold(
      appBar: AppBar(
        title: const Text("Card Matching "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (gameProvider.gameOver) 
              Column(
                children: [
                  Text(
                    'Winner Winner Chicken Dinner!',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      gameProvider.initGame(); 
                    },
                    child: Text("Play Again?"),
                  ),
                ],
              )
            else
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, 
                  ),
                  itemCount: gameProvider.cards.length,
                  itemBuilder: (context, index) {
                    final card = gameProvider.cards[index];
                    return GestureDetector(
                      onTap: () {
                        if (!card.revealed) {
                          gameProvider.selectCard(card);
                        }
                      },
                      child: Card(
                        child: card.revealed
                            ? Image.asset(card.img) 
                            : Container(
                                color: Colors.orange, 
                                child: Center(
                                  child: Text("Tap"),
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
