import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:player_card/Pages/Card_stack.dart';

import 'package:player_card/Pages/Card_page.dart';
import 'package:player_card/Pages/PerspectiveListView.dart';
import 'package:player_card/Pages/Player_Details.dart';
import 'package:player_card/Pages/Transition.dart';
import 'package:player_card/Pages/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: CardStack(
        cardCount: PlayerDetails.playerdetails.length,
      ),
    );
  }
}
