import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:login_demo/components/category.dart';
import 'package:login_demo/components/category1.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_demo/model/User.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final User user = User();


  void _getJsonFromSharedPreference()  {
    SharedPreferences.getInstance().then((prefs) {
      if(prefs.containsKey('user')){
       String? temp =  prefs.getString('user');
       Map<String, dynamic> json = jsonDecode(temp!);
       user.fromJson(json);
       setState(() {
       });
      }

    });



  }

  @override
  void initState() {
    super.initState();
    _getJsonFromSharedPreference();

  }

  // void _getPropertiesFromSharedPreference() async {
  //   int id = 0;
  //   String name = '', phone = '';
  //   bool success = false;
  //   final prefs = await SharedPreferences.getInstance();
  //   if (prefs.containsKey('id'))
  //     id = prefs.getInt('id')!;
  //   if (prefs.containsKey('name'))
  //     name = prefs.getString('name')!;
  //   if (prefs.containsKey('phone'))
  //     phone = prefs.getString('phone')!;
  //   if (prefs.containsKey('success'))
  //     success = prefs.getBool('success')!;
  //   user.setValues(id: id, name: name, phone: phone, success: success);
  //   setState(() {});
  //
  // }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff404F66),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 45,top: 20),
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu, color: Colors.blue, size: 40,),
                                  SizedBox(width: 5,),
                                  Text('Profile', style: TextStyle(fontSize: 20
                                  ),)
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 225),
                                child: GestureDetector(
                                  onTap: () async {
                                    SharedPreferences prefs = await SharedPreferences
                                        .getInstance();
                                    prefs.remove('success');
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(
                                            builder: (BuildContext ctx) =>
                                                LoginScreen()));
                                  },
                                  child: Text(
                                    "Log Out",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20

                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            children: [
                            Container(
                              decoration: BoxDecoration(
                                // border: Border(),
                                // color: Colors.white,
                                // borderRadius: BorderRadius.all(Radius.circular(50))
                              ),
                              child: SizedBox(
                              height: 150,
                              width: 150,
                              child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 70.0,
                                      child: ClipOval(




                                        child: FadeInImage.assetNetwork(placeholder: 'lib/assets/image/bundo-kim.png',
                                          image: 'https://dev.ecom.advn.vn/${user.image}',
                                          fit: BoxFit.cover,
                                          width: 140,
                                          height: 140,


                                        ),
                                        ),
                                      ),
                                      // child: CircleAvatar(
                                      //   backgroundImage:  ImageProvider(),
                                      //   radius: 68.0,
                                      // ),
                                    ),
                                  Positioned(
                                    right: 55,
                                    bottom: 1,
                                    child: SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25)),
                                            // side: BorderSide(color: Colors.white),
                                          ),
                                          primary: Colors.white,
                                          // backgroundColor: Color(0xFFF5F6F9),
                                        ),
                                        onPressed: () {

                                        },
                                        child: Container(
                                          height: 35,
                                            width: 35,
                                            child: SvgPicture.asset("lib/assets/icons/Camera Icon.svg"),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                          ),
                            ),
                              SizedBox(height: 22,),
                              Text('${user.name}   ${user.phone}',style: TextStyle(color: Colors.black),),
                            ],
                          ),
                        )
                      ],
                    ),
                    height: 330,
                    width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70)),
                      image: DecorationImage(
                        image: AssetImage('lib/assets/image/bundo-kim.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Categories(),
              Categories1(),
            ],
          ),
        ),
      ),
    );
  }
}






