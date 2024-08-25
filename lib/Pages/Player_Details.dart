class PlayerDetails {
  String name;
  int age;
  String school;
  String position;
  int gamesPlayed;
  int triesScored;
  int penaltiesGiven;
  int redC;
  int yellowC;
  

  PlayerDetails(this.name, this.age, this.school,this.position
  , this.gamesPlayed,
      this.triesScored, this.penaltiesGiven, this.redC, this.yellowC,
      );

  static List<PlayerDetails> playerdetails = [
    PlayerDetails('Example name', 12, 'Royal College','Centers' ,10, 8, 1, 3,1),
    //PlayerDetails('Example name 2', 14, 'Royal College', 'Hooker',23, 13, 2, 3, 4),
  ];
}
