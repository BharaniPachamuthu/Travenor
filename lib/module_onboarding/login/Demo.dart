import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});





  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      body: Center(
        child: Text(''),
      ),
    );
  }

  
  void getdata() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.get('registeredEmails');
  }

}
