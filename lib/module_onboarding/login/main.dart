import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travenor/modle/data_view_model.dart';
import 'package:travenor/modle/onborad_model.dart';
import 'package:travenor/module_onboarding/login/SignIn.dart';
import 'package:travenor/module_onboarding/login/splashScreen.dart';

import 'Demo.dart';

void main() async {
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
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Travel> with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  late AnimationController _controller;
  late DataModel datamodel;
  int _currentPage = 0;

  final List<double> w = [2.0, 2.5, 2.5];
  final List<String> btn = ['Get start', 'Next', 'Next'];

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
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 853),
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 700.h,
              child: PageView.builder(
                controller: _pageController,
                itemCount: datamodel.onboardmodel.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final onboard = datamodel.onboardmodel[index];
                  return SafeArea(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 470.h,
                              width: 395.w,
                              child: Image.asset(
                                onboard.images,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 60, right: 30),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Bounceable(
                                  onTap: () {},
                                  scaleFactor: 0.7,
                                  child: TextButton(
                                    onPressed: () {
                                      Get.to(const SignIn());
                                    },
                                    child: Text(
                                      onboard.textone,
                                      style: const TextStyle(
                                        color: Colors.lightBlueAccent,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: onboard.textTwo,
                                style: const TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: onboard.textThree,
                                style: const TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          widthFactor: w[index],
                          child: Image.asset(
                            onboard.imageone,
                            height: 20,
                            width: 100,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboard.textfour,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        // const SizedBox(height: 10),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            SmoothPageIndicator(
              controller: _pageController,
              count: datamodel.onboardmodel.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.lightBlueAccent,
                dotHeight: 8,
                dotWidth: 15,
              ),
            ),
            const SizedBox(height: 50),
            Bounceable(
              onTap: () {
                if (_currentPage < datamodel.onboardmodel.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Final action on Get Start
                  Get.to(() => const SignIn());
                }
              },
              scaleFactor: 0.7,
              child: Container(
                height: 57.h,
                width: 335.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                ),
                child: Center(
                  child: Text(
                    btn[_currentPage],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
