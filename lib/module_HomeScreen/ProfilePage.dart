import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List icon = [
    Icons.person,
    Icons.bookmark_border_rounded,
    Icons.flight,
    Icons.settings,
    Icons.travel_explore_outlined
  ];

  List lable = [
    'profile',
    'Bookmarked',
    'Previous Trips',
    'settings',
    'version'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackbutton(),
              const SizedBox(height: 20),
              _buildProfileInfo(),
              const SizedBox(height: 20),
              _buildRewardPointsCard(),
              const SizedBox(height: 40),
              buildListview(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackbutton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xFFF7F7F9),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
          ),
          const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CircleAvatar(
            radius: 25,
            backgroundColor: Color(0xFFF7F7F9),
            child: Icon(
              Icons.mode_edit_outline_outlined,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.person,
              size: 50,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Bharani",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            "bharani@gmail.com",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardPointsCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Reward Points",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                "360",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          Container(
            width: 1, // Define the width for the vertical line
            height: 80,
            color: Colors.grey, // Divider color
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Travel Tips",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                "236",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
          Container(
            width: 1, // Define the width for the vertical line
            height: 80,
            color: Colors.grey, // Divider color
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Bucket List",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                "473",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildListview() {
    return Expanded(
      child: ListView.builder(
        itemCount: icon.length,
        itemBuilder: (context, index) {
          return Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Bounceable(
              onTap: () {},
              child: ListTile(
                leading: Icon(icon[index],color: Colors.grey.shade600,),
                title: Text(
                  lable[index],
                  style: const TextStyle(fontFamily: 'SF UI Display',fontSize: 16),
                ),
                trailing:  Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey.shade600,),
                tileColor: Colors.white,
                contentPadding: const EdgeInsets.all(10),
              ),
            ),
          );
        },
      ),
    );
  }
}
