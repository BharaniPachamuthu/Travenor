import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class Homepagestate extends State<Travel> with SingleTickerProviderStateMixin{

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
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
      builder: (context, child) => SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              onboardOneWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget onboardOneWidget() {
    return Column(
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
          height: 50,
        ),
        const SizedBox(
            height: 194,
            width: 309,
            child: Text(
              'Life is short and the \n      world is wild',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            )),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 70.h,
          width: 300.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue,
          ),
          child: Center(
              child: TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => onboardtwo(),
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
    );
  }
}

class onboardtwo extends StatelessWidget {
  const onboardtwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                    child:
                        CircleAvatar(radius: 4, backgroundColor: Colors.blue),
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
                    child:
                        CircleAvatar(radius: 4, backgroundColor: Colors.grey),
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
                    child:
                        CircleAvatar(radius: 4, backgroundColor: Colors.grey),
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
                    builder: (context) => onboardtwo(),
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
    Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // Backgr ound Image
              Positioned.fill(
                child: SizedBox(
                  height: 470.h,
                  width: 395.w,
                  child: Image.asset(
                    'images/boat.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Skip button at the top-right
              Positioned(
                top: 40,
                right: 16,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(radius: 4, backgroundColor: Colors.blue),
                  SizedBox(width: 8),
                  CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                  SizedBox(width: 8),
                  CircleAvatar(radius: 4, backgroundColor: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),
              // Get Started Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
