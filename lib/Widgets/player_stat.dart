import 'package:flutter/material.dart';
import 'package:player_card/Widgets/big_text.dart';
import 'package:player_card/colors.dart';

class Playerstat extends StatelessWidget {
  final String text;
  final int number;
  const Playerstat({Key? key, required this.text, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          color:  AppColors.Textcolor,
        ),
        BigText(text: number.toString(),
          color:  AppColors.Textcolor,
        )
      ],
    );
  }
}
