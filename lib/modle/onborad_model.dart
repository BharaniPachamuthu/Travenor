class DataModel {
  final List<onboard> onboardmodel;

  DataModel({
    required this.onboardmodel,
  });
}

class onboard {
  late String images;
  late String textone;
  late String textTwo;
  late String textThree;
  late String imageone;
  late String textfour;
  late String textfive;

  onboard({
    required this.images,
    required this.textone,
    required this.textTwo,
    required this.textThree,
    required this.imageone,
    required this.textfour,
    required this.textfive,
  });
}
