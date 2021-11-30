import 'package:flutter/material.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var success = prefs.getBool('success');

  print(success);


  runApp(MaterialApp(home: success == null ? LoginScreen() : ProfileScreen()));
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,


      home: LoginScreen(),
    );
  }
}

