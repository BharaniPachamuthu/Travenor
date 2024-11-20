import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:travenor/model/data_view_model.dart';
import 'package:travenor/model/onborad_model.dart';

class PopularPackage extends StatefulWidget {
  const PopularPackage({super.key});

  @override
  State<PopularPackage> createState() => PopularPackageState();
}

class PopularPackageState extends State<PopularPackage> {
  late final DataModel data;

  @override
  void initState() {
    super.initState();
    data = Dataviewmodel.exampledata();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackButton(),
              const SizedBox(height: 30),
              const Text(
                '   All Popular Trip Packages',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(child: _buildPopularLocations()),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildBackButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.shade200,
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: Get.back,
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        const Text(
          "Popular Package",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 50),
      ],
    );
  }

  Widget _buildPopularLocations() {
    return ListView.builder(
      itemCount: data.Popularmodel.length,
      itemBuilder: (context, index) {
        final item = data.Popularmodel[index];
        return _buildPopularPackageItem(item);
      },
    );
  }

  Widget _buildPopularPackageItem(item) {
    return Bounceable(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    item.images ?? '',
                    height: 120,
                    width: 95,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.hotelname ?? 'Unknown Hotel',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      _buildIconTextRow(item.icon, item.date),
                      const SizedBox(height: 5),
                      _buildIconTextRow(item.icon1, item.rating),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          item.profile ?? const SizedBox(),
                          const SizedBox(width: 5),
                          Text(item.person ?? ''),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 30,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue),
                      child: Center(
                        child: Text(
                          item.price ?? '\$0.00',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIconTextRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}
