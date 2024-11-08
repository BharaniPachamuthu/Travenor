import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/splashScreen.dart';

void main() {
  runApp(const Travenor());
}

class Travenor extends StatelessWidget {
  const Travenor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 853),
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            onboardOneWidget(),
          ],
        ),
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
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(radius: 4,backgroundColor: Colors.blue,),
              SizedBox(width: 8),
              CircleAvatar(radius: 4,backgroundColor: Colors.grey,),
              SizedBox(width: 8),
              CircleAvatar(radius: 4,backgroundColor: Colors.grey,),
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
                    builder: (context) => const Onboardtwo(),
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
}

class Onboardtwo extends StatelessWidget {
  const Onboardtwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  'images/Vector2.png',height: 20,width: 100,
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
            const SizedBox(height: 40),
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
                      builder: (context) => const Onboardthree(),
                    )),
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
    );
  }
}

class Onboardthree extends StatelessWidget {
  const Onboardthree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              height: 50,
            ),
            const Text(
              "Life is short and the world is",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "wide",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
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
            const SizedBox(height: 40),
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
                      builder: (context) => const Onboardtwo(),
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
    );
  }
}
