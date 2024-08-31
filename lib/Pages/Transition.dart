import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:player_card/Pages/Card.dart';
import 'package:player_card/Pages/Player_Details.dart';

class ZoomingComponent extends StatelessWidget {
  final String tag;

  ZoomingComponent({
    required this.tag,
  });

  List<PlayerDetails> player = PlayerDetails.playerdetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Color.fromARGB(255, 0, 2, 20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewRoute(tag: tag),
            ),
          );
        },
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 150,
              child: Hero(
                tag: "${tag}1",
                child: Material(
                    color: Colors.transparent,
                    child: Container(
                      height: 200,
                      width: 220,
                      child: PCard(
                        name: player[0].name,
                        age: player[0].age,
                        school: player[0].school,
                        position: player[0].position,
                        gamesPlayed: player[0].gamesPlayed,
                        triesScored: player[0].triesScored,
                        penaltiesGiven: player[0].penaltiesGiven,
                        redC: player[0].redC,
                        yellowC: player[0].yellowC,
                      ),
                    )),
              ),
            ),
            Positioned(
              top: 190,
              child: Hero(
                tag: "${tag}2",
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 200,
                    width: 250,
                    child: PCard(
                      name: player[1].name,
                      age: player[1].age,
                      school: player[1].school,
                      position: player[1].position,
                      gamesPlayed: player[1].gamesPlayed,
                      triesScored: player[1].triesScored,
                      penaltiesGiven: player[1].penaltiesGiven,
                      redC: player[1].redC,
                      yellowC: player[1].yellowC,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230,
              child: Hero(
                tag: "${tag}3",
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 200,
                    width: 280,
                    child: PCard(
                      name: player[2].name,
                      age: player[2].age,
                      school: player[2].school,
                      position: player[2].position,
                      gamesPlayed: player[2].gamesPlayed,
                      triesScored: player[2].triesScored,
                      penaltiesGiven: player[2].penaltiesGiven,
                      redC: player[2].redC,
                      yellowC: player[2].yellowC,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 270,
              child: Hero(
                tag: "${tag}4",
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 200,
                    width: 310,
                    child: PCard(
                      name: player[3].name,
                      age: player[3].age,
                      school: player[3].school,
                      position: player[3].position,
                      gamesPlayed: player[3].gamesPlayed,
                      triesScored: player[3].triesScored,
                      penaltiesGiven: player[3].penaltiesGiven,
                      redC: player[3].redC,
                      yellowC: player[3].yellowC,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 310,
              child: Hero(
                tag: "${tag}5",
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 400,
                    width: 340,
                    child: PCard(
                      name: player[4].name,
                      age: player[4].age,
                      school: player[4].school,
                      position: player[4].position,
                      gamesPlayed: player[4].gamesPlayed,
                      triesScored: player[4].triesScored,
                      penaltiesGiven: player[4].penaltiesGiven,
                      redC: player[4].redC,
                      yellowC: player[4].yellowC,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  final String tag;

  const NewRoute({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: "${tag}1",
                child: Material(
                  color: Colors.red,
                  child: SizedBox(
                      height: 170,
                      width: 300,
                      child: Container(
                          color: Colors.red, child: Text('Hello World! 2'))),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: "${tag}2",
                child: Material(
                  color: Colors.green,
                  child: SizedBox(
                      height: 170,
                      width: 300,
                      child: Container(
                          color: Colors.green, child: Text('Hello World! 2'))),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: "${tag}3",
                child: Material(
                  color: Colors.red,
                  child: SizedBox(
                      height: 170,
                      width: 300,
                      child: Container(
                          color: Colors.red, child: Text('Hello World! 2'))),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
