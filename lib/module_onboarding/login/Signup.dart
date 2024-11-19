import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _Signupstate createState() => _Signupstate();
}


class _Signupstate extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  late String name, email;
  late int password;
  var obscureText = false.obs;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      iconSize: 24,
                      constraints: const BoxConstraints(),
                      color: Colors.grey,
                      splashRadius: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                const Text(
                  'Sign up now',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please fill th details and create account',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: Color(0xff7d848d),
                  ),
                ),
                const SizedBox(height: 30),
                _buildInputField('Enter your name', obscureText: false),
                const SizedBox(height: 30),
                _buildInputField('Enter your Email', obscureText:  false),
                const SizedBox(height: 30),
                _buildInputField('Enter your password',obscureText: true),
                const SizedBox(height: 50),
                _buildSignInButton(),
                const SizedBox(height: 50),
                RichText(
                  text: const TextSpan(
                    text: "Already have an account  ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(color: Colors.blue),
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
                const SizedBox(height: 80),
                _buildSocialIcons(),
              ],
            ),
          ),
        ),
      ),
    ));
  }

    Widget _buildInputField(String labelText, {required bool obscureText}) {
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
          decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            suffixIcon: obscureText ? Obx(
                  () => IconButton(
                onPressed: () {
                  this.obscureText.value = !this.obscureText.value;
                },
                icon: Icon(this.obscureText.value ? Icons.visibility_off : Icons.visibility,),),
            ): null,
            border: InputBorder.none,
          ),
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
          onPressed: () => _signup(),
          child: const Text('Sign up',
              style: TextStyle(color: Colors.white, fontSize: 16)),
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

  void _signup() async {
    if (formkey.currentState!.validate()) {
      try {
        name = namecontroller.text.trim();
        email = emailcontroller.text.trim();
        password = passwordcontroller.text.trim() as int;


        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Account Created Successfully!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.blue,
        ));
        Get.to(() => const Signup());
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sign Up Failed: $e'),
          backgroundColor: Colors.red,
        ));
      }
    }
  }

  void getdata() async{
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.setString('name', name.toString());
    prefer.setString('email', email.toString());
    prefer.setString('password', password.toString());
    print(name);

  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

}
