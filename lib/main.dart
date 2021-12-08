import 'package:flutter/material.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/User.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var login = prefs.getBool('login');

  print(login);


  runApp(MaterialApp(home: login == null ? LoginScreen() : ProfileScreen()));
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

