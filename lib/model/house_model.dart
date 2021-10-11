class HouseModel {
  final String? clubname;
  final String? clubtopic;
  final String? usercount;
  final String? comments;

  HouseModel({this.clubname, this.clubtopic, this.usercount, this.comments});
}

List club = [
  {
    "clubname": "STARTUP CLUB",
    "clubtopic": "🤓MASTERCLASS: Write a Tech Resume That Pays",
    "usercount": "93",
    "comments": "7",
  },
  {
    "clubname": "YOUNG, WILD & FREE",
    "clubtopic": "TRUE CRIME💀🎃Serial Killers, Abduction & DARK WEB",
    "usercount": "1K",
    "comments": "65",
  },
  {
    "clubname": "HOT ON THE MIC",
    "clubtopic": "🚨Afternoon Delight Comedy Show!😂🚀🍑",
    "usercount": "343",
    "comments": "61",
  },
  {
    "clubname": "STARTUP CLUB",
    "clubtopic": "🤓MASTERCLASS: Write a Tech Resume That Pays",
    "usercount": "93",
    "comments": " 7",
  },
];

List<HouseModel> getListOfHouse() {
  return club
      .map(
        (item) => HouseModel(
          clubname: item["clubname"],
          clubtopic: item["clubtopic"],
          comments: item["comments"],
          usercount: item["usercount"],
        ),
      )
      .toList();
}
