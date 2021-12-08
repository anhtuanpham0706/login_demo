import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:login_demo/api/api.dart';
import 'package:login_demo/model/User.dart';
import 'package:login_demo/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';






class UpdateScreen extends StatefulWidget {

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final User user = User();
  String message = '';
  bool remember = false;
  bool remember1 = false;
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
  void _saveJsonToSharedPreference(api) =>
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('user', jsonEncode(api));

      }
      );


  @override
  void initState() {
    super.initState();
    _getJsonFromSharedPreference();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue),
            onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Color(0xff46546B),
          toolbarHeight:MediaQuery.of(context).size.height/10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40))
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 15),
                    floatingLabelBehavior: FloatingLabelBehavior
                        .always,

                    labelText: "Name",
                    labelStyle: TextStyle(
                        color: Colors.black, fontSize: 20),
                    hintText: user.name,

                  ),
                  ),
                ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15),
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always,
                        hintText: user.phone,

                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextFormField(
                      controller: addressController,
                      decoration: InputDecoration(
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 15),
                        floatingLabelBehavior: FloatingLabelBehavior
                            .always,
                        hintText: "Address",

                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            value: remember,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                remember = value;

                              });
                            },
                          ),
                        ),
                        Text("Default location",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 1.3,
                          child: Checkbox(
                            value: remember1,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              setState(() {
                                remember1 = value;
                              });
                            },
                          ),
                        ),
                        Text("Company",style: TextStyle(fontSize: 15),),
                      ],
                    ),
                  ),


                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250,),
              child: Container(
                color: Colors.black,
                height: 50,
                width: 250,
                child: TextButton(
                  onPressed: () async {
                    var name = nameController.text;
                    var phone = phoneController.text;
                    var address = addressController.text;

                   var api = await update_user(user.token_user, name, phone, address);
                   if(api['success']){
                     _saveJsonToSharedPreference(api['data']);
                     setState(() {
                       showDialog(
                           context: context,
                           builder: (_) =>
                               AlertDialog(
                                 title: Text('Trạng thái update'),
                                 content: Text('Thành Công'),
                               )
                       );
                     });

                   }


                  },
                  child: Text('UPDATE',style: TextStyle(color: Colors.white,fontSize: 25),),

                ),
              ),
            ),


          ],
        ),


      ),

    );
  }




}
