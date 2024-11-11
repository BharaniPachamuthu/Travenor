import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travenor/module_onboarding/login/Signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  String? emailError;
  String? passworderror;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {Navigator.pop(context);},
                        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
                  _buildInputField('Enter your Email', obscureText: false, validator: validateEmail),
                  if (emailError != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        emailError!,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ),
                  const SizedBox(height: 30),
                  _buildInputField('Enter your password', obscureText: true, validator: validatePassword),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
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
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 150),
                  _buildSocialIcons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String labelText, {bool obscureText = false, String? Function(String?)? validator}) {
    return Container(
      height: 56.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          labelText: labelText,
          alignLabelWithHint: false,
          suffixIcon: obscureText ? const Icon(Icons.remove_red_eye) : null,
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Container(
      height: 56.h,
      width: 335.w,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? false) {

            }
          },
          child: const Text(
            'Sign In',
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
}
