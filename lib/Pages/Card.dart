import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:player_card/Widgets/big_text.dart';
import 'package:player_card/Widgets/player_stat.dart';
import 'package:player_card/colors.dart';
import 'package:player_card/dimensions.dart';

class PCard extends StatelessWidget {
  final String name;
  final int age;
  final String school;
  final String position;
  final int gamesPlayed;
  final int? triesScored;
  final int? penaltiesGiven;
  final int? redC;
  final int? yellowC;

  const PCard(
      {super.key,
      required this.name,
      required this.age,
      required this.school,
      required this.position,
      required this.gamesPlayed,
      this.triesScored,
      this.penaltiesGiven,
      this.redC,
      this.yellowC});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
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
                    text: name,
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
                right: Dimensions.width10 / 2, left: Dimensions.width10 / 2),
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
                Center(
                    child: Text(
                  school,
                  style: TextStyle(
                      fontSize: Dimensions.font20, color: AppColors.Textcolor),
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
                          position,
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
                          age.toString(),
                          style: TextStyle(
                              fontSize: Dimensions.font15,
                              color: AppColors.Textcolor),
                        )
                      ],
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: Dimensions.height30,
                      left: Dimensions.width30,
                      right: Dimensions.width30,
                      bottom: Dimensions.height30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Playerstat(text: "Games Played", number: gamesPlayed),
                      Playerstat(text: "Tries Scored", number: triesScored!),
                      Playerstat(
                          text: "Penalties Given", number: penaltiesGiven!),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: Dimensions.width10 * 3.5,
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
                          Text(redC.toString(),
                              style: TextStyle(
                                fontSize: Dimensions.font15,
                                color: AppColors.Textcolor,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width10 * 3.5,
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
                          Text(yellowC.toString(),
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
          ))
        ],
      ),
    );
  }
}
