import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:travenor/model/data_view_model.dart';
import 'package:travenor/model/onborad_model.dart';


class popularplace extends StatefulWidget {
  const popularplace({super.key});

  @override
  State<popularplace> createState() => _popularplaceState();
}

class _popularplaceState extends State<popularplace> {
  late DataModel data;

  @override
  void initState() {
    super.initState();
    data = Dataviewmodel.exampledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              _buildBackButton(),
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Text(
                    '   All Popular Place',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              buildPlaces(),
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
          "Popular Place",
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

  Widget buildPlaces() {
    return Expanded(
        child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        mainAxisExtent: 260,
        childAspectRatio: 1.0,
      ),
      itemCount: data.placemodel.length,
      itemBuilder: (context, index) {
        final place = data.placemodel[index];
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.hotelname,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              place.location,
                              color: Colors.grey,
                            ),
                            Text(
                              place.locname,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          children: [
                            ...List.generate(
                              3,
                              (index) {
                                return Icon(
                                  place.icon1,
                                  color: Colors.yellow,
                                );
                              },
                            ),
                            Text(place.rating)
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              place.price,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.blue),
                            ),
                            Text(
                              place.person,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ));
  }
}
