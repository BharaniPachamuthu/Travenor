import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:travenor/model/data_view_model.dart';
import '../model/onborad_model.dart';
import 'Homepage/popularplace.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  CalenderState createState() => CalenderState();
}

class CalenderState extends State<Calender> {
  late DataModel datamodel;
  var focuseday = DateTime.now().obs;
  var selectday = DateTime.now().obs;
  var calenderform = CalendarFormat.week.obs;
  late String dete;

  void selectDay(DateTime newSelectedDay, DateTime newFocusedDay) {
    selectday.value = newSelectedDay;
    focuseday.value = newFocusedDay;
  }

  void changeFormat(CalendarFormat newFormat) {
    calenderform.value = newFormat;
  }

  void updateFocusedDay(DateTime newFocusedDay) {
    focuseday.value = newFocusedDay;
  }

  @override
  void initState() {
    super.initState();
    datamodel = Dataviewmodel.exampledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            _buildBackButton(),
            const SizedBox(
              height: 20,
            ),
            calendeer(),
            const SizedBox(
              height: 30,
            ),
            textWidget(),
            Expanded(child: schecudle()),
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
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            child: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
    );
  }

  Widget calendeer() {
    return Container(
      height: 150,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => TableCalendar(
                    focusedDay: focuseday.value,
                    firstDay: DateTime(2000),
                    lastDay: DateTime(2100),
                    selectedDayPredicate: (day) =>
                        isSameDay(selectday.value, day),
                    onDaySelected: (selected, focused) {
                      setState(() {
                        selectday.value = selected;
                        focuseday.value = focused;
                      });
                    },
                    onFormatChanged: (format) {
                      changeFormat(format);
                    },
                    onPageChanged: (focusedDay) {
                      updateFocusedDay(focusedDay);
                    },
                    calendarFormat: CalendarFormat.week,
                    headerStyle: HeaderStyle(
                      titleCentered: false,
                      formatButtonVisible: false,
                      formatButtonShowsNext: false,
                      titleTextFormatter: (date, locale) {
                        dete = DateFormat(' dd MMM yyyy').format(date);
                        return dete;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget textWidget() {
    return const Padding(
      padding: EdgeInsets.only(left: 10, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('My Schedule',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: 'SF UI Display',
                color: Colors.black,
              )),
          Text('View all',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ))
        ],
      ),
    );
  }

  Widget schecudle() {
    return ListView.builder(
      itemCount: datamodel.destinationmodel.length,
      itemBuilder: (context, index) {
        final destination = datamodel.destinationmodel[index];
        return Bounceable(
          onTap: () {Get.to(popularplace());},
          child: Padding(
            padding: const EdgeInsets.all(8),
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
                        destination.calender,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month,color: Colors.grey),
                              Text(dete,style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(destination.textone),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(destination.icon1,color: Colors.blue),
                              Text(destination.textThree,style: TextStyle(color: Colors.grey),)
                            ],
                          )
                        ],
                      ),
                    ),
                    const Center(
                      heightFactor: 3.5,
                        child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
