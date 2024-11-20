import 'package:flutter/material.dart';

class DataModel {
  final List<onboard> onboardmodel;
  final List<Popular> Popularmodel;
  final List<search> searchmodel;
  final List<destination> destinationmodel;
  final List<Popularplac> placemodel;

  DataModel({
    required this.onboardmodel,
    required this.Popularmodel,
    required this.searchmodel,
    required this.destinationmodel,
    required this.placemodel,
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


class Popular {
  late String images;
  late String hotelname;
  late IconData icon;
  late String date;
  late IconData icon1;
  late String rating;
  late CircleAvatar profile;
  late String person;
  late String price;

  Popular({
    required this.images,
    required this.hotelname,
    required this.icon,
    required this.date,
    required this.icon1,
    required this.rating,
    required this.profile,
    required this.person,
    required this.price
  });
}

class search {
  late String images;
  late String hotelname;
  late IconData location;
  late String locname;
  late String price;
  late String text;

  search({
    required this.images,
    required this.hotelname,
    required this.location,
    required this.locname,
    required this.price,
    required this.text,
  });
}

class destination {
  late String images;
  late String calender;
  late String textone;
  late IconData icon;
  late String textTwo;
  late IconData icon1;
  late String textThree;
  late IconData textfour;

  destination({
    required this.images,
    required this.calender,
    required this.textone,
    required this.icon,
    required this.textTwo,
    required this.icon1,
    required this.textThree,
    required this.textfour,
  });
}



class Popularplac {
  late String images;
  late String hotelname;
  late IconData location;
  late String locname;
  late IconData icon1;
  late String rating;
  late String person;
  late String price;

  Popularplac({
    required this.images,
    required this.hotelname,
    required this.location,
    required this.locname,
    required this.icon1,
    required this.rating,
    required this.person,
    required this.price
  });
}

