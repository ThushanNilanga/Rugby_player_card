import 'package:flutter/cupertino.dart';
import 'package:player_card/dimensions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  String fontfamily;
  BigText(
      {Key? key,
      this.color = const Color(0xFF332d2b),
      required this.text,
      this.size = 0,
      this.fontfamily = 'Roboto',
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: fontfamily==''?'Roboto':fontfamily,
          color: color,
          fontSize: size == 0 ? Dimensions.font15 : size,
          fontWeight: FontWeight.w400),
    );
  }
}
