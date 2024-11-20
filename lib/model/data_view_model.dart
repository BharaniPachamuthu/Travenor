import 'package:flutter/material.dart';
import 'onborad_model.dart';

class Dataviewmodel {
  static DataModel exampledata() {
    return DataModel(onboardmodel: [
      onboard(
          images: 'images/boat.jpg',
          textone: 'Skip',
          textTwo: "Life is short and the\n     world is ",
          textThree: 'wide',
          imageone: 'images/Vector.png',
          textfour: "At Friends tours and travel, we customize\n"
              "reliable and trustworthy educational tours to\n"
              "destinations all over the world",
          textfive: 'Get start'),
      onboard(
          images: 'images/onboard2.png',
          textone: 'Skip',
          textTwo: "it's a big world out\n     there go ",
          textThree: 'explore',
          imageone: 'images/Vector2.png',
          textfour: "At Friends tours and travel, we customize\n"
              "reliable and trustworthy educational tours to\n"
              "destinations all over the world",
          textfive: 'Next'),
      onboard(
          images: 'images/onbord3.png',
          textone: 'Skip',
          textTwo: "People don't take trips,\n     trips take ",
          textThree: 'People',
          imageone: 'images/Vector2.png',
          textfour: "At Friends tours and travel, we customize\n"
              "reliable and trustworthy educational tours to\n"
              "destinations all over the world",
          textfive: 'Next'),
    ], Popularmodel: [
      Popular(
          images: 'images/img.png',
          hotelname: 'Santorini Islnd',
          icon: Icons.calendar_month,
          date: '26 july-30 Oct',
          icon1: Icons.star,
          rating: '4.7',
          profile: const CircleAvatar(),
          person: '24 Person joined',
          price: '\$820'),
      Popular(
          images: 'images/img_1.png',
          hotelname: 'Bukita Rayandro',
          icon: Icons.calendar_month,
          date: '26 july-30 Oct',
          icon1: Icons.star,
          rating: '4.7',
          profile: const CircleAvatar(),
          person: '24 Person joined',
          price: '\$720'),
      Popular(
          images: 'images/img_2.png',
          hotelname: 'Cluster Omega',
          icon: Icons.calendar_month,
          date: '26 july-30 Oct',
          icon1: Icons.star,
          rating: '4.7',
          profile: const CircleAvatar(),
          person: '24 Person joined',
          price: '\$942'),
      Popular(
          images: 'images/img_3.png',
          hotelname: 'Shajek Bandorban',
          icon: Icons.calendar_month,
          date: '26 july-30 Oct',
          icon1: Icons.star,
          rating: '4.7',
          profile: const CircleAvatar(),
          person: '24 Person joined',
          price: '\$860'),
    ], searchmodel: [
      search(
          images: 'images/img_7.png',
          hotelname: 'Niladri Reservoir',
          location: Icons.location_on_outlined,
          locname: 'Tekergat, Sunamgnj',
          price: '\$894/',
          text: 'person'),
      search(
          images: 'images/img_8.png',
          hotelname: 'Casa Las Tirtugas',
          location: Icons.location_on_outlined,
          locname: 'Av Damero, Mexico',
          price: '\$894/',
          text: 'person'),
      search(
          images: 'images/img_9.png',
          hotelname: 'Aonang Villa Resort',
          location: Icons.location_on_outlined,
          locname: 'Bastola, Islampur',
          price: '\$761/',
          text: 'person'),
      search(
          images: 'images/img_10.png',
          hotelname: 'Rangauti Resort',
          location: Icons.location_on_outlined,
          locname: 'Sylhet, Airport Road',
          price: '\$857/',
          text: 'person')
    ], destinationmodel: [
      destination(
        images: 'images/house.jpg',
        calender: 'images/img_4.png',
        textone: ' Niladri Reservoir',
        icon: Icons.star,
        textTwo: '4.7',
        icon1: Icons.location_on_outlined,
        textThree: 'Tekergat,sunamnj',
        textfour: Icons.person,
      ),
      destination(
          images: 'images/house.jpg',
          calender: 'images/img_6.png',
          textone: ' Darma Reservoirs',
          icon: Icons.star,
          textTwo: '4.9',
          icon1: Icons.location_on_outlined,
          textThree: 'Darma,Kuningan',
          textfour: Icons.person),
      destination(
          images: 'images/house.jpg',
          calender: 'images/img_5.png',
          textone: ' High Rich Park',
          icon: Icons.star,
          textTwo: '4.7',
          icon1: Icons.location_on_outlined,
          textThree: 'Zeero Point,sylhet',
          textfour: Icons.person),
    ], placemodel: [
      Popularplac(
          images: 'images/img_7.png',
          hotelname: 'Niladri Reservoir',
          location: Icons.location_on_outlined,
          locname: 'Tekergat, Sunamgnj',
          icon1: Icons.star,
          rating: '4.7',
          price: '\$894/',
          person: 'person'),
      Popularplac(
          images: 'images/img_8.png',
          hotelname: 'Casa Las Tirtugas',
          location: Icons.location_on_outlined,
          locname: 'Av Damero, Mexico',
          icon1: Icons.star,
          rating: '5.0',
          price: '\$894/',
          person: 'person'),
      Popularplac(
          images: 'images/img_9.png',
          hotelname: 'Aonang Villa Resort',
          location: Icons.location_on_outlined,
          locname: 'Bastola, Islampur',
          icon1: Icons.star,
          rating: '5.0',
          price: '\$894/',
          person: 'person'),
      Popularplac(
          images: 'images/img_10.png',
          hotelname: 'Rangauti Resort',
          location: Icons.location_on_outlined,
          locname: 'Sylhet, Airport Road',
          icon1: Icons.star,
          rating: '5.0',
          price: '\$894/',
          person: 'person')
    ]);
  }
}
