import 'package:flutter/material.dart';
import 'package:player_card/Pages/Card.dart';
import 'package:player_card/Pages/Card_page.dart';
import 'package:player_card/Pages/Player_Details.dart';

class CardStack extends StatelessWidget {
  final int cardCount;

  CardStack({required this.cardCount});
  List<PlayerDetails> player = PlayerDetails.playerdetails;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: List.generate(cardCount, (index) {
        double scale = 0.8 + (index * (0.2 / (cardCount - 1)));
        double topOffset = index * 20.0;

        return Positioned(
          top: topOffset,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: ExpandedCardListPage(),
                    );
                  },
                ),
              );
            },
            child: Hero(
              tag: 'card_$index',
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: 300 * scale,
                  height: 400,
                  child: Center(
                      child: PCard(
                    name: player[index].name,
                    age: player[index].age,
                    school: player[index].school,
                    position: player[index].position,
                    gamesPlayed: player[index].gamesPlayed,
                    triesScored: player[index].triesScored,
                    penaltiesGiven: player[index].penaltiesGiven,
                    redC: player[index].redC,
                    yellowC: player[index].yellowC,
                  )),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class ExpandedCardListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded Cards')),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: player.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: 'card_$index',
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              height: 380,
              child: PCard(
                name: player[index].name,
                age: player[index].age,
                school: player[index].school,
                position: player[index].position,
                gamesPlayed: player[index].gamesPlayed,
                triesScored: player[index].triesScored,
                penaltiesGiven: player[index].penaltiesGiven,
                redC: player[index].redC,
                yellowC: player[index].yellowC,
              ),
            ),
          );
        },
      ),
    );
  }
}
