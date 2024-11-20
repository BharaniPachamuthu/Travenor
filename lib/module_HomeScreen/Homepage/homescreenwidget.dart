import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travenor/model/data_view_model.dart';
import 'package:travenor/module_HomeScreen/Homepage/PopularPackage.dart';
import '../../model/onborad_model.dart';
import 'Details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<Home> {
  var name = ''.obs;
  late DataModel dataModel;

  @override
  void initState() {
    super.initState();
    dataModel = Dataviewmodel.exampledata();
    loadUserName();
  }

  Future<void> loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? 'Guest';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  headerWidget(),
                  const SizedBox(height: 30),
                  headerTextWidget(),
                  const SizedBox(height: 20),
                  textWidget(true),
                  const SizedBox(height: 20),
                  destinations(),
                  const SizedBox(height: 20),
                  textWidget(false),
                  const SizedBox(height: 20),
                  popular(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => userInfoCard(name.value)),
        notificationIcon(),
      ],
    );
  }

  Widget userInfoCard(String userName) {
    return Container(
      height: 54.h,
      width: 150.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(),
          ),
          Text(
            userName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget notificationIcon() {
    return Bounceable(
      onTap: loadUserName,
      child: CircleAvatar(
        radius: 27,
        backgroundColor: Colors.grey.shade200,
        child: const Icon(Icons.notifications_outlined),
      ),
    );
  }

  Widget headerTextWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Explore the\n',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'Beautiful ',
                style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              TextSpan(
                text: 'World!',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Align(
          alignment: Alignment.center,
          widthFactor: 5.5,
          child: Image.asset(
            'images/Vector2.png',
            height: 10.h,
            width: 100.w,
          ),
        ),
      ],
    );
  }

  Widget textWidget(bool text) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text ? 'Best Destination' : 'PopularPackage',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF UI Display',
                color: Colors.black,
              )),
          TextButton(
            onPressed: () {
              Get.to(const PopularPackage(),
                  transition: Transition.size,
                  duration: const Duration(seconds: 1));
            },
            child: const Text('View all',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                )),
          ),
        ],
      ),
    );
  }

  Widget destinations() {
    return SizedBox(
      height: 384.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataModel.destinationmodel.length,
        itemBuilder: (context, index) {
          final destination = dataModel.destinationmodel[index];
          return Bounceable(
            onTap: () {
              Get.to(() => const Details());
            },
            child: Container(
              width: 268.w,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    SizedBox(
                      height: 285.h,
                      width: 240.w,
                      child: Image.asset(
                        destination.images,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          destination.textone,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'SF UI Display',
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              destination.icon,
                              color: Colors.yellow,
                            ),
                            Text(destination.textTwo),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                destination.icon1,
                                color: Colors.blue,
                              ),
                              Text(
                                destination.textThree,
                              ),
                            ],
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: List.generate(3, (stackIndex) {
                                return Positioned(
                                  left: stackIndex * 15,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.blue.shade500,
                                    child: Icon(
                                      destination.textfour,
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget popular() {
    return SizedBox(
      height: 344.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataModel.Popularmodel.length,
        itemBuilder: (context, index) {
          final popular = dataModel.Popularmodel[index];
          return Bounceable(
            onTap: () {
              Get.to(const Details());
            },
            child: Container(
              width: 238.w,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    SizedBox(
                        height: 260.h,
                        width: 240.w,
                        child: Image.asset(
                          popular.images,
                        )),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  popular.hotelname,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'SF UI Display',
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      popular.icon1,
                                      color: Colors.yellow,
                                    ),
                                    Text(popular.rating)
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.blue,
                                    ),
                                    Text(popular.price),
                                  ],
                                ),
                                const CircleAvatar(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
