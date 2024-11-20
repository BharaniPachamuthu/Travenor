import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travenor/module_HomeScreen/calender.dart';
import 'package:travenor/module_HomeScreen/serchpage.dart';
import 'Homepage/homescreenwidget.dart';
import 'ProfilePage.dart';
import 'message.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var selectedPage = 0.obs;

  final List<Widget> pages = [
    const Home(),
    const Calender(),
    const SearchPage(),
    const massagepage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => pages[selectedPage.value]),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            iconSize: 30,
            showUnselectedLabels: true,
            currentIndex: selectedPage.value,
            onTap: (value) => selectedPage.value = value,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month_rounded), label: 'Calendar'),
              BottomNavigationBarItem(
                icon: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                label: '',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.messenger_outline_outlined),
                  label: 'Messages'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Home Page'));
  }
}




