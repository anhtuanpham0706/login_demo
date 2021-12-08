import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_demo/api/api.dart';
import 'package:login_demo/components/category.dart';
import 'package:login_demo/components/category1.dart';
import 'package:login_demo/screens/login_screen.dart';
import 'package:login_demo/screens/profile_bloc.dart';
import 'package:login_demo/screens/update_information.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_demo/model/User.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {
  final User user = User();
  final  source = null;

  final String base64 = '';
   PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  final ProfileBloc _bloc = ProfileBloc();



  void _getJsonFromSharedPreference()  {
    SharedPreferences.getInstance().then((prefs) {
      if(prefs.containsKey('user')){
       String temp =  prefs.getString('user');
       Map<String, dynamic> json = jsonDecode(temp);
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
                                  SizedBox(width: 10,),
                                  Image(image: AssetImage('lib/assets/icons/Group 569.png'),height: 30,width: 30,),
                                  // Icon(
                                  //   Icons.menu, color: Colors.blue, size: 40,),
                                  SizedBox(width: 10,),
                                  Text('Profile', style: TextStyle(fontSize: 25
                                  ),),
                                ],
                              ),
                              Spacer(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,

                                children: [
                                    GestureDetector(
                                      onTap: () async {
                                        SharedPreferences prefs = await SharedPreferences
                                            .getInstance();
                                        prefs.remove('user');
                                        prefs.remove('login');
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
                                  SizedBox(width: 10,),
                                ],
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
                              height: 170,
                              width: 170,
                              child: Stack(
                                fit: StackFit.expand,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 60.0,
                                      backgroundImage: _imageFile == null

                                        ? NetworkImage("https://dev.ecom.advn.vn/${user.image}") as ImageProvider
                                         :FileImage(File(_imageFile.path)),


                                      // NetworkImage("https://dev.ecom.advn.vn/${user.image}")
                                      // child: ClipOval(
                                      //
                                      //   child: FadeInImage.assetNetwork(placeholder: 'lib/assets/image/bundo-kim.png',
                                      //     image: 'https://dev.ecom.advn.vn/${user.image}',
                                      //     fit: BoxFit.cover,
                                      //     width: 140,
                                      //     height: 140,
                                      //   ),
                                      //   ),
                                      ),

                                    ),
                                  Positioned(
                                    right: 63,
                                    bottom: 1,
                                    child: SizedBox(
                                      height: 35,
                                      width: 35,
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
                                          showModalBottomSheet(
                                            context: context,
                                            builder: ((builder) => bottomSheet()),
                                          );
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
                              SizedBox(height: 30,),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => UpdateScreen()),
                                  );
                                },
                                  child: Text('${user.name}   ${user.phone}',
                                    style: TextStyle(color: Colors.black,fontSize: 18),)),
                            ],
                          ),
                        )
                      ],
                    ),
                    height: 365,
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
  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                   takePhoto(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }
  void takePhoto(ImageSource camera) => _bloc.add(TakePhotoEvent(source));



  // void takePhoto(ImageSource source) async {
  //   var status = await Permission.photos.status;
  //   if(status.isGranted){
  //     final pickedFile = await _picker.getImage(
  //         source: source);
  //     setState(() {
  //       _imageFile = pickedFile;
  //       File file = File(pickedFile.path);
  //       List<int> bytes = file.readAsBytesSync();
  //       String base64 = base64Encode(bytes);
  //       update_avatar(user.token_user, base64);
  //     });
  //   } else if(status.isGranted){
  //     final pickedFile = await _picker.getImage(
  //         source: source);
  //     setState(() {
  //       _imageFile = pickedFile;
  //       File file = File(pickedFile.path);
  //       List<int> bytes = file.readAsBytesSync();
  //       String base64 = base64Encode(bytes);
  //       update_avatar(user.token_user, base64);
  //     });
  //   }
  // }




}














