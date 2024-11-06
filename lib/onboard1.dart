import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class onboard1 extends StatefulWidget{
  @override
  onboard createState() => onboard();
  
}

class onboard extends State<onboard1> {
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
                          child: const Text(
                              'Skip',
                              style: TextStyle(color: Color(0xFFFCAEAFF),fontSize: 18,
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
                color: const Color(0xFFF0D6EFD),
              ),
              child: const Center(
                  child: Text(
                    'Get start',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
            ),
          ],
        ),
      );
  }
  
}
