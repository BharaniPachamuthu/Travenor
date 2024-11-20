import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travenor/model/data_view_model.dart';
import '../../model/onborad_model.dart';


class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var isExpanded = false.obs;
  late DataModel data;

  List gridimg = [
    'images/Rectangle 822.jpg',
    'images/Rectangle 823.jpg',
    'images/Rectangle 824.jpg',
    'images/Rectangle 825.jpg',
    'images/lastimg.jpg'
  ];

  @override
  void initState() {
    super.initState();
    data = Dataviewmodel.exampledata();
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 470.h,
                    width: screenWidth,
                    child: Image.asset(
                      'images/building.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  _buildBackButton(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(top: 400),
                      height: 476.h,
                      width: screenWidth,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 6.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              headertextwiget(),
                              const SizedBox(height: 20),
                              subtextwiget(),
                              const SizedBox(
                                height: 20,
                              ),
                              multipleimg(),
                              const SizedBox(
                                height: 20,
                              ),
                              aboutDestination(),
                              const SizedBox(
                                height: 20,
                              ),
                              _buildSignUpButton(),
                            ],
                          ),
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
    );
  }

  Widget _buildBackButton() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black54,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            ),
          ),
          const Text(
            "Details",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black54,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border_rounded,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget headertextwiget() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                 'Niladri Reservoir',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              'Tekergat sunamgnj',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        CircleAvatar(
          radius: 20,
        ),
      ],
    );
  }

  Widget subtextwiget() {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.blue,
        ),
        const Text(
          'Tekergat',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
         SizedBox(
          width: 30.w,
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        const Text(
          '4.7(2498)',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
         SizedBox(
          width: 30.w,
        ),
        RichText(
          text: const TextSpan(
              text: '\$59/',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blue,
              ),
              children: [
                TextSpan(
                  text: '/person',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                )
              ]),
        )
      ],
    );
  }

  Widget multipleimg() {
    return SizedBox(
      height: 50.h,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 30,
          crossAxisSpacing: 30,
          childAspectRatio: 1,
        ),
        itemCount: gridimg.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              gridimg[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  Widget aboutDestination() {
    return GestureDetector(
      onTap: () {
        isExpanded.value = !isExpanded.value;
      },
      child: Obx(() => RichText(
            text: TextSpan(
              text: 'About Destination\n',
              style: const TextStyle(
                fontSize: 24,
                fontFamily: 'SF UI Display',
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text: isExpanded.value
                      ? 'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Many place are looking like haven with beatiful atmosphere, Resedensic view are wondering with the sunshine,  Have you ever been on holiday to the Greek ETC, '
                      : 'You will get a complete travel package on the beaches. Packages in the form of airline tickets, recommended Hotel rooms, Transportation, Have you ever been on holiday to the Greek ETC. ',
                  style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 5,
                    fontFamily: 'SF UI Display',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500,
                  ),
                ),
                TextSpan(
                  text: isExpanded.value ? 'Showless' : '...Read more',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.orange.shade600,
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildSignUpButton() {
    return Bounceable(
      onTap: () {},
      child: Container(
        height: 56.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Book Now',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
