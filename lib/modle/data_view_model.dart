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

    ]);
  }
}
