import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
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

  var obscureText = false.obs;
  String? name='',email='',password='';

  @override
  void initState() {
    super.initState();
    // loaduser();
    WidgetsBinding.instance.addPostFrameCallback((_) => loaduser());
  }




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
                _buildInputField(
                  'Enter your name',
                  validator: validateName,
                  obscureText: false,
                  controller: namecontroller,
                ),
                const SizedBox(height: 30),
                _buildInputField(
                  'Enter your Email',
                  validator: validateEmail,
                  obscureText: false,
                  controller: emailcontroller,
                ),
                const SizedBox(height: 30),
                _buildInputField('Enter your password',
                    validator: validatePassword,
                    obscureText: true,
                    controller: passwordcontroller),
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
                Text(
                  name?.isNotEmpty == true ? name! : 'Empty',
                  style: const TextStyle(
                    fontSize: 14,
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

  Widget _buildInputField(String labelText,
      {required bool obscureText,
      String? Function(String?)? validator,
      required TextEditingController controller}) {
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
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            alignLabelWithHint: true,
            suffixIcon: obscureText
                ? IconButton(
              onPressed: () => setState(() { obscureText = !obscureText;}),
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            )
                : null,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton() {
    return Bounceable(
      onTap: () {
        _signup();
      },
      child: Container(
        height: 56.h,
        width: 335.w,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child:  const Center(
          child: Text('Sign up',
              textAlign: TextAlign.center,
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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
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


  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }


  void _signup() async {
    if (formkey.currentState!.validate()) {
      try {
         name = namecontroller.text.trim();
         email = emailcontroller.text.trim();
         password = passwordcontroller.text.trim();

        await saveUser(name!, email!, password!);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Account Created Successfully!'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.blue,
        ));

        // Get.to(() => const SignIn());
      }on Exception catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Sign Up Failed: $e'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ));
      }
    }
  }


  Future<void> saveUser(String name,String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
     await prefs.setString('name', name);
     await prefs.setString('email', email);
     await prefs.setString('password', password);
     loaduser();
  }

  void loaduser() async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? '';
      email = prefs.getString('email') ?? '';
      password = prefs.getString('password') ?? '';
    });

  }

  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }
}
