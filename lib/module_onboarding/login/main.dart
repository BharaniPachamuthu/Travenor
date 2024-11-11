import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travenor/modle/data_view_model.dart';
import 'package:travenor/modle/onborad_model.dart';
import 'package:travenor/module_onboarding/login/SignIn.dart';
import 'package:travenor/module_onboarding/login/splashScreen.dart';


void main() {
  runApp(const Travenor());
}

class Travenor extends StatelessWidget {
  const Travenor({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travenor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  Homepagestate createState() => Homepagestate();
}

class Homepagestate extends State<Travel> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late DataModel datamodel;

    List<dynamic> w=[2.0,2.5,2.5];


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    datamodel = Dataviewmodel.exampledata();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(393, 853),
      builder: (context, child) => Scaffold(
        body: PageView.builder(
          itemCount: datamodel.onboardmodel.length,
          itemBuilder: (context, index) {
            final board = datamodel.onboardmodel[index];
          return SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 470.h,
                      width: 395.w,
                      child: Image.asset(
                        board.images,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, right: 5),
                      child: Align(
                          alignment: Alignment.topRight,
                          heightFactor: 0.5,
                          child: TextButton(
                              onPressed: () {},
                              child:  Text(
                                  board.textone,
                                  style: const TextStyle(
                                    color: Colors.lightBlue,
                                    fontSize: 18,
                                  )))),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                RichText(
                  text:  TextSpan(
                    children: [
                      TextSpan(
                        text: board.textTwo,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                              text: board.textThree,
                              style: const TextStyle(color: Colors.deepOrange))
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    widthFactor: w[index],
                    child: Image.asset(
                      board.imageone,
                      height: 20,
                      width: 100,
                    )),
                const SizedBox(height: 10),
                Text(
                        board.textfour,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(seconds: 3),
                      height: 10.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.blue),
                    ),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    const CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Container(
                  height: 57.h,
                  width: 335.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue,
                  ),
                  child: Center(
                      child: TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Onboardtwo(),
                            )),
                        child:  Text(
                              board.textfive,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          );
        },),
      ),
    );
  }



  Widget onboardOneWidget() {
    return SafeArea(
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 470.h,
                width: 395.w,
                child: Image.asset(
                  'images/boat.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 5),
                child: Align(
                    alignment: Alignment.topRight,
                    heightFactor: 0.5,
                    child: TextButton(
                        onPressed: () {},
                        child: const Text('Skip',
                            style: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 18,
                            )))),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: "Life is short and the\n     world is ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'wide',
                        style: TextStyle(color: Colors.deepOrange))
                  ],
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.centerRight,
              widthFactor: 2.6,
              child: Image.asset(
                'images/Vector.png',
              )),
          const SizedBox(height: 10),
          Text(
            "At Friends tours and travel, we customize\n"
            "reliable and trustworthy educational tours to\n"
            "destinations all over the world",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 3),
                height: 10.h,
                width: 20.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.blue),
              ),
              const SizedBox(width: 8),
              const CircleAvatar(
                radius: 4,
                backgroundColor: Colors.grey,
              ),
              const SizedBox(width: 8),
              const CircleAvatar(
                radius: 4,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            height: 57.h,
            width: 335.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,
            ),
            child: Center(
                child: TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  Onboardtwo(),
                  )),
              child: const Text(
                'Get start',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget Onboardtwo(){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 470.h,
                    width: 395.w,
                    child: Image.asset(
                      'images/onboard2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, right: 5),
                    child: Align(
                        alignment: Alignment.topRight,
                        heightFactor: 0.5,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Skip',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 18,
                                )))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios)),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "it's a big world out\n     there go ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'explore',
                            style: TextStyle(color: Colors.deepOrange))
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 2.5,
                  child: Image.asset(
                    'images/Vector2.png',
                    height: 20,
                    width: 100,
                  )),
              const SizedBox(height: 10),
              Text(
                "At Friends tours and travel, we customize\n"
                    "reliable and trustworthy educational tours to\n"
                    "destinations all over the world",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 30),
              // Page Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.5),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CircleAvatar(
                            radius: 4, backgroundColor: Colors.blue),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.5),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CircleAvatar(
                            radius: 4, backgroundColor: Colors.grey),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.5),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CircleAvatar(
                            radius: 4, backgroundColor: Colors.grey),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 57.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                    child: TextButton(
                      onPressed: () => Get.to(Onboardthree()),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Onboardthree(){
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 470.h,
                    width: 395.w,
                    child: Image.asset(
                      'images/onbord3.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, right: 5),
                    child: Align(
                        alignment: Alignment.topRight,
                        heightFactor: 0.5,
                        child: TextButton(
                            onPressed: () {},
                            child: const Text('Skip',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 18,
                                )))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios)),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "People don't take trips,\n     trips take ",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                            text: 'People',
                            style: TextStyle(color: Colors.deepOrange))
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  widthFactor: 2.5,
                  child: Image.asset(
                    'images/Vector2.png',
                    height: 20,
                    width: 100,
                  )),
              const SizedBox(height: 10),
              Text(
                "At Friends tours and travel, we customize\n"
                    "reliable and trustworthy educational tours to\n"
                    "destinations all over the world",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                ),
              ),
              const SizedBox(height: 30),
              // Page Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.5),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CircleAvatar(
                            radius: 4, backgroundColor: Colors.blue),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.5),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CircleAvatar(
                            radius: 4, backgroundColor: Colors.grey),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: 1.0, end: 0.5),
                    duration: const Duration(seconds: 1),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: const CircleAvatar(
                            radius: 4, backgroundColor: Colors.grey),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Container(
                height: 57.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                    child: TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignIn(),
                          )),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




