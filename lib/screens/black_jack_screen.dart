import 'package:black_jack/provider/game_controller.dart';
import 'package:black_jack/widgets/card_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlackJackScreen extends StatefulWidget {
  const BlackJackScreen({super.key});

  @override
  State<BlackJackScreen> createState() => _BlackJackScreenState();
}

class _BlackJackScreenState extends State<BlackJackScreen> {

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameControllerProvider>(
      builder: (context, gameController, child){
        return Scaffold(
          body: gameController.isGameStarted
            ? SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text("Dealers score ${gameController.dealerScore}", style: TextStyle(
                            color: gameController.dealerScore <= 21 ? Colors.green[900]:Colors.red[900])
                          ),
                          SizedBox(height: 20,),
                          cardsGridView(cards: gameController.dealersCards)
                        ],
                      ),
                      Column(
                        children: [
                          Text("Players score ${gameController.playerScore}",style: TextStyle(
                            color: gameController.playerScore <= 21 ? Colors.green[900]:Colors.red[900])
                          ),
                          SizedBox(height: 20,),
                          cardsGridView(cards: gameController.myCards)
                        ],
                      ),
                      IntrinsicWidth(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            MaterialButton(
                              onPressed: gameController.addCard,
                              color: Colors.brown[200],
                              child: Text("Add another card"),
                            ),
                        
                            MaterialButton(
                              onPressed: gameController.changeCards,
                              color: Colors.brown[200],
                              child: Text("Next round"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),  
              )
            : Center(
                child: MaterialButton(
                  onPressed: (){
                    gameController.changeCards();
                  },
                  color: Colors.brown[200],
                  child: Text("Start the game"),
                ),
              )
        );
      }
    );
  }
}

