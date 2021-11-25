import 'package:flutter/material.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,


      home: LoadPage(),
    );
  }
}

class LoadPage extends StatefulWidget {




  @override
  LoadPageState createState() => LoadPageState();
}

class LoadPageState extends State {
  var newLaunch;



  @override
  void initState() {
    super.initState();
    loadNewLaunch();
  }

  loadNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      bool _newLaunch = ((prefs.getBool('newLaunch') ?? true));
      newLaunch = _newLaunch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return newLaunch ? LoginScreen() : ProfileScreen();
  }


}
