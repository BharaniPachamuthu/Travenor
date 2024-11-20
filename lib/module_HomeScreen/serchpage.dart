import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travenor/model/data_view_model.dart';
import 'package:travenor/model/onborad_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = TextEditingController();
  var searchbar = true.obs;
  late DataModel data;

  @override
  void initState() {
    super.initState();
    data = Dataviewmodel.exampledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildBackButton(),
            const SizedBox(height: 10),
            buildSearchBar(),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text(
                  '   Search Places',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Obx(() =>
                searchbar.value ? buildPlaces() : Expanded(child: search())),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          const Text(
            "schedule",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              searchbar.value = true;
            },
            child: const Text(
              'cancel',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget buildSearchBar() {
    return Container(
      height: 48.h,
      width: 335.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200,
      ),
      padding: const EdgeInsets.all(13),
      child: TextField(
        controller: controller,
        onTap: () {
          searchbar.value = !searchbar.value;
          print(searchbar.value);
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded, color: Colors.grey),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 24,
                width: 1,
                color: Colors.grey,
              ),
              const SizedBox(width: 10),
              const Icon(Icons.mic, color: Colors.grey),
            ],
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          labelText: 'Search Places',
          labelStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildPlaces() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 20,
          mainAxisExtent: 230,
        ),
        itemCount: data.searchmodel.length,
        itemBuilder: (context, index) {
          final place = data.searchmodel[index];
          return Bounceable(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Image.asset(
                      place.images,
                      height: 124,
                      width: 137,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.hotelname,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Icon(place.location, color: Colors.grey),
                              Text(
                                place.locname,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Text(
                                place.price,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue,
                                ),
                              ),
                              Text(
                                place.text,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
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

  Widget search() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
