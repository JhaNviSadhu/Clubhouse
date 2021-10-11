class RoomModel {
  final String? name;
  final String img;

  RoomModel({
    this.name,
    required this.img,
  });
}

List room = [
  {
    "name": "Open",
    "img": "assets/open.png",
  },
  {
    "name": "Social",
    "img": "assets/social.png",
  },
  {
    "name": "Closed",
    "img": "assets/closed.png",
  },
  {
    "name": "Desi Devs",
    "img": "assets/ioschar.jpeg",
  },
  {
    "name": "Flutter Developer",
    "img": "assets/flutter.jpg",
  },
  {
    "name": "Python",
    "img": "assets/python.png",
  },
  {
    "name": "Dart",
    "img": "assets/dartlogo.png",
  },
];

List<RoomModel> getListOfRoom() {
  return room
      .map(
        (item) => RoomModel(
          name: item["name"],
          img: item["img"],
        ),
      )
      .toList();
}
