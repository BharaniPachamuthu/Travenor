import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travenor/module_onboarding/login/Demo.dart';
import 'package:travenor/module_onboarding/login/Signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  FocusNode emailfocusNode = FocusNode();
  FocusNode passwordfocusNode = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const String registeredEmails = 'registeredEmails';

  var obscureText = true.obs;

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
                children: <Widget>[
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.black),
                        iconSize: 24,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        color: Colors.grey,
                        splashRadius: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    'Sign in now',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please sign in to continue our app',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color(0xff7d848d),
                    ),
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    'Enter your Email',
                    obscureText: false,
                    validator: validateEmail,
                    controller: _emailController,
                    focus: emailfocusNode,
                  ),
                  const SizedBox(height: 30),
                  _buildInputField(
                    'Enter your password',
                    obscureText: obscureText.value,
                    validator: validatePassword,
                    controller: _passwordController,
                    focus: passwordfocusNode,
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 2.8,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  _buildSignInButton(),
                  const SizedBox(height: 50),
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account?   ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(const Signup());
                            },
                          style: const TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Or connect',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 120),
                  _buildSocialIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(
    String labelText, {
    required bool obscureText,
    String? Function(String?)? validator,
    required TextEditingController controller,
    required FocusNode focus,
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
          obscureText: obscureText ? this.obscureText.value : false,
          validator: validator,
          controller: controller,
          focusNode: focus,
          decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            border: InputBorder.none,
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () => setState(() => this.obscureText.value = !this.obscureText.value),
                    icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Bounceable(
      scaleFactor: 0.7,
      onTap: () {
        _signin();
      },
      child: Container(
        height: 56.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
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

  // Fuctionality

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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _signin() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final registeredEmails = prefs.getStringList('registeredEmails') ?? [];
      String emails = _emailController.text.trim();
      String passwords = _passwordController.text.trim();

      if (registeredEmails.contains(emails)) {
        final storedPassword = prefs.getString(emails);
        if (storedPassword == passwords) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Signin Successfully!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.blue,
          ));
          // Navigate to another screen
          Get.to(() => const Demo());

          _emailController.clear();
          _passwordController.clear();
          emailfocusNode.unfocus();
          passwordfocusNode.unfocus();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Invalid password'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No account found with this email'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailfocusNode.dispose();
    passwordfocusNode.dispose();
    obscureText.close();
    super.dispose();
  }
}
