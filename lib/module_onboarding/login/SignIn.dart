import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travenor/module_onboarding/login/Signup.dart';
import 'package:travenor/module_onboarding/login/forgotpassword.dart';
import '../../module_HomeScreen/home_screen.dart';

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

  var obscureText = true.obs;
  var name = ''.obs, email = ''.obs, password = ''.obs;
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final users = <String>[].obs;

  @override
  void initState() {
    super.initState();
    loadUser();
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
                children: <Widget>[
                  _buildBackButton(),
                  const SizedBox(height: 50),
                  _buildHeaderText(),
                  const SizedBox(height: 30),
                  _buildInputField(
                    'Enter your Email',
                    obscureText: false,
                    validator: validateEmail,
                    controller: _emailController,
                    focus: emailfocusNode,
                    errorMessage: emailError,
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => _buildInputField(
                      'Enter your password',
                      obscureText: obscureText.value,
                      validator: validatePassword,
                      controller: _passwordController,
                      focus: passwordfocusNode,
                      toggleVisibility: () => obscureText.toggle(),
                      errorMessage: emailError,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerRight,
                    widthFactor: 2.8,
                    child: GestureDetector(
                      onTap: () => Get.to(const ForgotPassword()),
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
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
                  const SizedBox(height: 100),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        GestureDetector(
          onTap: () => swtichUser(),
          child: const CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Icon(Icons.person_2_rounded),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderText() {
    return const Column(
      children: [
        Text(
          'Sign in now',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
        ),
        SizedBox(height: 10),
        Text(
          'Please sign in to continue our app',
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
    required bool obscureText,
    String? Function(String?)? validator,
    required TextEditingController controller,
    required FocusNode focus,
    VoidCallback? toggleVisibility,
    required RxString errorMessage,
  }) {
    return Column(
      children: [
        Container(
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
                suffixIcon: toggleVisibility != null
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: toggleVisibility,
                      )
                    : null,
              ),
            ),
          ),
        ),
        Obx(
          () => errorMessage.value.isEmpty
              ? const SizedBox.shrink()
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 30),
                      child: Text(
                        errorMessage.value,
                        style: TextStyle(color: Colors.red, fontSize: 14.sp),
                      ),
                    ),
                  ],
                ),
        ),
      ],
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

  Future<dynamic> swtichUser() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: SizedBox(
            height: 400,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Switch User',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: name.value.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(5),
                          child: ListTile(
                            leading: const CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.blue,
                              child: Icon(Icons.person_2_rounded),
                            ),
                            title: Text(name.value),
                            subtitle: Text(email.value),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
    Get.to(() => const HomeScreen());
    if (formKey.currentState!.validate()) {
      final prefs = await SharedPreferences.getInstance();

      List<String> registeredEmails =
          prefs.getStringList('registeredEmails') ?? [];
      email.value = _emailController.text.trim();
      password.value = _passwordController.text.trim();


      if (registeredEmails.contains(email.value)) {
        final storedPassword = prefs.getString(email.value);
        name.value = prefs.getString('name')!;
        if (storedPassword == password.value) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Signin Successfully!'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.blue,
          ));
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ));

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

  void loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    email.value = prefs.getString('email') ?? '';
    password.value = prefs.getString('password') ?? '';
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
