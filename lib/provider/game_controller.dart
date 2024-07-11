import 'dart:math';

import 'package:flutter/material.dart';

class GameControllerProvider extends ChangeNotifier{

  bool isGameStarted = false;

  List<Image> myCards = [];

  List<Image> dealersCards = [];

  String? dealersFirstCard;
  String? dealersSecondCard;

  String? playersFirstCard;
  String? playersSecondCard;

  int playerScore = 0;
  int dealerScore = 0;

  final Map<String, int> deckOfCards = {
    "assets/cards/2.1.png": 2,
    "assets/cards/2.2.png": 2,
    "assets/cards/2.3.png": 2,
    "assets/cards/2.4.png": 2,
    "assets/cards/3.1.png": 3,
    "assets/cards/3.2.png": 3,
    "assets/cards/3.3.png": 3,
    "assets/cards/3.4.png": 3,
    "assets/cards/4.1.png": 4,
    "assets/cards/4.2.png": 4,
    "assets/cards/4.3.png": 4,
    "assets/cards/4.4.png": 4,
    "assets/cards/5.1.png": 5,
    "assets/cards/5.2.png": 5,
    "assets/cards/5.3.png": 5,
    "assets/cards/5.4.png": 5,
    "assets/cards/6.1.png": 6,
    "assets/cards/6.2.png": 6,
    "assets/cards/6.3.png": 6,
    "assets/cards/6.4.png": 6,
    "assets/cards/7.1.png": 7,
    "assets/cards/7.2.png": 7,
    "assets/cards/7.3.png": 7,
    "assets/cards/7.4.png": 7,
    "assets/cards/8.1.png": 8,
    "assets/cards/8.2.png": 8,
    "assets/cards/8.3.png": 8,
    "assets/cards/8.4.png": 8,
    "assets/cards/9.1.png": 9,
    "assets/cards/9.2.png": 9,
    "assets/cards/9.3.png": 9,
    "assets/cards/9.4.png": 9,
    "assets/cards/10.1.png": 10,
    "assets/cards/10.2.png": 10,
    "assets/cards/10.3.png": 10,
    "assets/cards/10.4.png": 10,
    "assets/cards/J1.png": 10,
    "assets/cards/J2.png": 10,
    "assets/cards/J3.png": 10,
    "assets/cards/J4.png": 10,
    "assets/cards/Q1.png": 10,
    "assets/cards/Q2.png": 10,
    "assets/cards/Q3.png": 10,
    "assets/cards/Q4.png": 10,
    "assets/cards/K1.png": 10,
    "assets/cards/K2.png": 10,
    "assets/cards/K3.png": 10,
    "assets/cards/K4.png": 10,
    "assets/cards/A1.png": 11,
    "assets/cards/A2.png": 11,
    "assets/cards/A3.png": 11,
    "assets/cards/A4.png": 11,
  };

  Map<String, int> playingCards = {};

  void addCard(){
    if (playingCards.isNotEmpty) {
      Random random = Random();
      String cardkey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == cardkey);
      myCards.add(Image.asset(cardkey));
      playerScore = playerScore + deckOfCards[cardkey]!;
    }
    notifyListeners();
  }
  
  void changeCards(){
    isGameStarted = true;

    playingCards = {};
    playingCards.addAll(deckOfCards);

    myCards = [];
    dealersCards = [];

    Random random = Random();
    String cardOneDealerKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardOneDealerKey);
    String cardTwoDealerKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardTwoDealerKey);

    String cardOnePlayerKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardOnePlayerKey);
    String cardTwoPlayerKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
    playingCards.removeWhere((key, value) => key == cardTwoPlayerKey);

    dealersFirstCard = cardOneDealerKey;
    dealersSecondCard = cardTwoDealerKey;
    
    playersFirstCard = cardOnePlayerKey;
    playersSecondCard = cardTwoPlayerKey;

    dealersCards.add(Image.asset(dealersFirstCard!));
    dealersCards.add(Image.asset(dealersSecondCard!));
    dealerScore = deckOfCards[dealersFirstCard]! + deckOfCards[dealersSecondCard]!;

    myCards.add(Image.asset(playersFirstCard!));
    myCards.add(Image.asset(playersSecondCard!));
    playerScore = deckOfCards[playersFirstCard]! + deckOfCards[playersSecondCard]!;

    if(dealerScore <= 14){
      String cardThreeDealerKey = playingCards.keys.elementAt(random.nextInt(playingCards.length));
      playingCards.removeWhere((key, value) => key == cardThreeDealerKey);

      dealersCards.add(Image.asset(cardThreeDealerKey));
      dealerScore += deckOfCards[cardThreeDealerKey]!;
    }
    notifyListeners();
  }
}