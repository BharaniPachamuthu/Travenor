import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignIn.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final obscureText = true.obs;
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => loadUser());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  _buildBackButton(),
                  const SizedBox(height: 50),
                  _buildHeaderText(),
                  const SizedBox(height: 30),
                  _buildInputField(
                    'Enter your name',
                    controller: nameController,
                    validator: _validateName,
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    'Enter your Email',
                    controller: emailController,
                    validator: _validateEmail,
                    obscureText: false,
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => _buildInputField(
                      'Enter your password',
                      controller: passwordController,
                      validator: _validatePassword,
                      obscureText: obscureText.value,
                      toggleVisibility: () => obscureText.toggle(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15,right: 150),
                    child: Text(
                      'Password must be 8 characters',
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 50),
                  _buildSignUpButton(),
                  const SizedBox(height: 50),
                  _buildSignInRedirect(),
                  const SizedBox(height: 30),
                  _buildUserDetails(),
                  const SizedBox(height: 80),
                  _buildSocialIcons(),
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
    return const Column(
      children: [
        Text(
          'Sign up now',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
        ),
        SizedBox(height: 10),
        Text(
          'Please fill the details and create an account',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: Color(0xff7d848d),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField(
    String labelText, {
    required TextEditingController controller,
    required bool obscureText,
    String? Function(String?)? validator,
    VoidCallback? toggleVisibility,
  }) {
    return Container(
      height: 56.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(15),
      child: Center(
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            suffixIcon: toggleVisibility != null
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: toggleVisibility,
                  )
                : null,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return Bounceable(
      onTap: _signup,
      child: Container(
        height: 56.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Sign up',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInRedirect() {
    return RichText(
      text: TextSpan(
        text: "Already have an account?   ",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        children: [
          TextSpan(
            text: 'Sign in',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.to(() => const SignIn()),
          ),
        ],
      ),
    );
  }

  Widget _buildUserDetails() {
    return const Text(
      'Or connect',
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildSocialIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialIcon('images/facebook.png'),
        const SizedBox(width: 20),
        _buildSocialIcon('images/instagram.png'),
        const SizedBox(width: 20),
        _buildSocialIcon('images/twitter.png'),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: Image.asset(assetPath),
    );
  }

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    const emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    final regex = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _signup() async {
    if (formKey.currentState!.validate()) {
      try {
        name.value = nameController.text.trim();
        email.value = emailController.text.trim();
        password.value = passwordController.text.trim();

        await _saveUser(name.value, email.value, password.value);

        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar('Account Created Successfully!', Colors.blue),
        );
        Get.to(const SignIn());
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar('Sign Up Failed: $e', Colors.red),
        );
      }
    }
  }

  Future<void> _saveUser(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> registeredEmails = prefs.getStringList('registeredEmails') ?? [];

    print(registeredEmails);

      registeredEmails.add(email);
      await prefs.setStringList('registeredEmails', registeredEmails);
      await prefs.setString(email, password);
      await prefs.setString('name', name);

  }

  Future<void> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
    password.value = prefs.getString('password') ?? '';
  }

  SnackBar _buildSnackBar(String message, Color backgroundColor) {
    return SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
