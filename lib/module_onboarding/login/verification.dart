import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  Verificationstate createState() => Verificationstate();
}

class Verificationstate extends State<Verification> {
  final List <TextEditingController>_controllers = TextEditingController() as List<TextEditingController>;
  var email = ''.obs;

  @override
  void initState() {
    super.initState();
    fetchemail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              buildBackButton(),
              SizedBox(height: 50.h),
              buildHeaderText(),
              SizedBox(height: 30.h),
              buildTextfield(),
              SizedBox(height: 40.h,),
              _buildVerifyButton(),
              SizedBox(height: 30.h,),
              buildResnd(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBackButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ],
    );
  }

  Widget buildHeaderText() {
    return Column(
      children: [
        const Text(
          'OTP Verification',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
        ),
        SizedBox(height: 20.h),
        Obx(
          () => Text(
            'Please check your email $email \n                 to see the verification code',
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Color(0xff7d848d),
            ),
          ),
        ),
        SizedBox(height: 40.h),
        const Row(
          children: [
            Text(
              'OTP Code',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTextfield() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          return Container(
            width: 70,
            height: 56,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.shade200),
            child: TextField(
              controller: _controllers[index],
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              maxLength: 1,
              decoration: const InputDecoration(
                counterText: "",
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 3) {
                  FocusScope.of(context).nextFocus();
                }
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildVerifyButton() {
    return Bounceable(
      onTap: () => {},
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Verify',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget buildResnd(){
    return  const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text(
      'Resend code to',
      style: TextStyle(color: Colors.black54),
    ),
    SizedBox(width: 5),
    Text(
    '01:26',
    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
    ),
  ]
    );
  }


  Future<void> fetchemail() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> registeredEmails =
        prefs.getStringList('registeredEmails') ?? [];
    email.value =
        registeredEmails.isNotEmpty ? registeredEmails.first : 'No email found';
  }
}
