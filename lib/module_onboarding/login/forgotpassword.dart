import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travenor/module_onboarding/login/verification.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final email = ''.obs;
  final emailError = ''.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _buildBackButton(),
                  SizedBox(height: 50.h),
                  _buildHeaderText(),
                  SizedBox(height: 50.h),
                  _buildInputField(
                    'Enter your email',
                    controller: emailController,
                    validator: validateEmail,
                    errorMessage: emailError,
                  ),
                  SizedBox(height: 50.h),
                  _buildResetButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
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

  Widget _buildHeaderText() {
    return Column(
      children: [
        const Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
        ),
        SizedBox(height: 20.h),
        const Text(
          'Enter your email account to reset\n                 your password',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Color(0xff7d848d),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(
    String labelText, {
    required TextEditingController controller,
    String? Function(String?)? validator,
    required RxString errorMessage,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 56.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.all(15),
          child: TextFormField(
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              border: InputBorder.none,
            ),
          ),
        ),
        Obx(
          () => errorMessage.value.isEmpty
              ? const SizedBox.shrink()
              : Padding(
                  padding: EdgeInsets.only(top: 10.h, left: 12.w),
                  child: Text(
                    errorMessage.value,
                    style: TextStyle(color: Colors.red, fontSize: 14.sp),
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildResetButton() {
    return Bounceable(
      onTap: () => resetpassword(context),
      child: Container(
        height: 56.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Reset Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  Future<void> resetpassword(BuildContext context) async {
    final validationMessage = validateEmail(emailController.text.trim());
    if (validationMessage != null) {
      emailError.value = validationMessage;
    } else {
      emailError.value = '';
      email.value = emailController.text.trim();

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.email,
                color: Colors.white,
              ),
            ),
            title: const Text('Check your email'),
            content: const Text(
              'We have sent password recovery \n         instructions to your email',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Center(child: Text('OK')),
              ),
            ],
          );
        },
      );
      Get.to(() => Verification());

    }
  }
}
