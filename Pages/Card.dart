import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:player_card/Widgets/big_text.dart';
import 'package:player_card/Widgets/player_stat.dart';
import 'package:player_card/colors.dart';
import 'package:player_card/dimensions.dart';

class PCard extends StatefulWidget {
  final double? height;
  final double? width;
  final int? index;
  final String name;
  final int age;
  final String school;
  final String position;
  final int gamesPlayed;
  final int? triesScored;
  final int? penaltiesGiven;
  final int? redC;
  final int? yellowC;

  PCard({
    super.key,
    required this.name,
    required this.age,
    required this.school,
    required this.position,
    required this.gamesPlayed,
    this.triesScored,
    this.penaltiesGiven,
    this.redC,
    this.yellowC,
    this.index,
    this.height,
    this.width,
  });

  @override
  State<PCard> createState() => _PCardState();
}

class _PCardState extends State<PCard> {
  final ScrollController _scrollController = ScrollController();
  double _dragStartOffset = 0.0;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: widget.height == 0 ? double.maxFinite : widget.height,
        width: widget.width == 0 ? double.maxFinite : widget.width,
        padding: EdgeInsets.only(
            top: Dimensions.height10,
            left: Dimensions.width10 / 2,
            right: Dimensions.width10 / 2,
            bottom: Dimensions.width10 / 10),
        //color: Color.fromARGB(255, 4, 17, 134),
        decoration: BoxDecoration(
            color: AppColors.MainColor,
            borderRadius: BorderRadius.circular(Dimensions.radius20)),
        child: CustomScrollView(
          controller: _scrollController,
          physics: _isDragging == true
              ? AlwaysScrollableScrollPhysics()
              : NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              surfaceTintColor: Colors.black,
              pinned: true,
              toolbarHeight: 00,
              backgroundColor: AppColors.MainColor,
              expandedHeight: Dimensions.height30 * 9,
              shadowColor: Colors.black,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height15),
                    alignment: Alignment.center,
                    width: Dimensions.Nameboxwidth,
                    padding: EdgeInsets.only(
                        top: Dimensions.height10, bottom: Dimensions.height10),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadowcolor,
                          offset: Offset(0, 2),
                          blurRadius: 5.0,
                        ),
                      ],
                      border: Border.all(
                          color: AppColors.bordercolor,
                          style: BorderStyle.solid,
                          width: 2),
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BigText(
                      text: widget.name,
                      color: Colors.white,
                      size: Dimensions.font12,
                    )),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.asset(
                  "assets/usernew.png",
                  width: double.maxFinite,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: Dimensions.height40 * 8,
                width: Dimensions.height40 * 7,
                padding: EdgeInsets.only(
                    top: Dimensions.height15,
                    bottom: Dimensions.height10 + Dimensions.height15),
                margin: EdgeInsets.only(
                    right: Dimensions.width10 / 2,
                    left: Dimensions.width10 / 2),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.bluegradient,
                        AppColors.blackgradient,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onPanStart: (details) {
                        setState(() {
                          _isDragging = true;
                        });
                        _dragStartOffset = details.globalPosition.dy;
                      },
                      onPanUpdate: (details) {
                        if (_isDragging) {
                          double delta =
                              _dragStartOffset - details.globalPosition.dy;
                          _scrollController.position.moveTo(
                            _scrollController.offset + delta,
                          );
                          _dragStartOffset = details.globalPosition.dy;
                        }
                      },
                      onPanEnd: (_) {
                        setState(() {
                          _isDragging = false;
                        });
                      },
                      child: Container(
                        height: 100,
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Center(
                                child: Text(
                              widget.school,
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  color: AppColors.Textcolor),
                            )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Position",
                                        style: TextStyle(
                                          fontSize: Dimensions.font13,
                                          color: AppColors.Statcolor,
                                        )),
                                    Text(
                                      widget.position,
                                      style: TextStyle(
                                          fontSize: Dimensions.font15,
                                          color: AppColors.Textcolor),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Age",
                                      style: TextStyle(
                                          fontSize: Dimensions.font13,
                                          color: AppColors.Statcolor),
                                    ),
                                    Text(
                                      widget.age.toString(),
                                      style: TextStyle(
                                          fontSize: Dimensions.font15,
                                          color: AppColors.Textcolor),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.height20,
                          left: Dimensions.width30,
                          right: Dimensions.width30,
                          bottom: Dimensions.height30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Playerstat(
                              text: "Games Played", number: widget.gamesPlayed),
                          Playerstat(
                              text: "Tries Scored",
                              number: widget.triesScored!),
                          Playerstat(
                              text: "Penalties Given",
                              number: widget.penaltiesGiven!),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: Dimensions.width10 * 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Dimensions.height10 * 4,
                                width: Dimensions.width35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15 / 3),
                                  color: AppColors.redcolor,
                                ),
                              ),
                              Text(widget.redC.toString(),
                                  style: TextStyle(
                                    fontSize: Dimensions.font15,
                                    color: AppColors.Textcolor,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.width10 * 3,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: Dimensions.height10 * 4,
                                width: Dimensions.width35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15 / 3),
                                  color: AppColors.yellowColor,
                                ),
                              ),
                              Text(widget.yellowC.toString(),
                                  style: TextStyle(
                                    fontSize: Dimensions.font15,
                                    color: AppColors.Textcolor,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
