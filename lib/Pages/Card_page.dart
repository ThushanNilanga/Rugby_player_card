import 'package:flutter/material.dart';
import 'package:player_card/Pages/Card.dart';
import 'package:player_card/Pages/PerspectiveListView.dart';
import 'package:player_card/Pages/Player_Details.dart';
import 'package:player_card/dimensions.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

List<PlayerDetails> player = PlayerDetails.playerdetails;

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 4, 64, 112),
        body: Container(
          padding: EdgeInsets.all(Dimensions.height10),
          margin: EdgeInsets.all(Dimensions.height30),
          child: Center(
            child: PageView.builder(
              scrollDirection: Axis.vertical,
              allowImplicitScrolling: true,
              controller: PageController(viewportFraction: .55),
              itemCount: PlayerDetails.playerdetails.length,
              itemBuilder: (context, index) {
                return PCard(
                  name: player[index].name,
                  age: player[index].age,
                  school: player[index].school,
                  position: player[index].position,
                  gamesPlayed: player[index].gamesPlayed,
                  triesScored: player[index].triesScored,
                  penaltiesGiven:
                      player[index].penaltiesGiven,
                  redC: player[index].redC,
                  yellowC: player[index].yellowC,
                );
              },
            ),
          ),
        ));
  }
}
