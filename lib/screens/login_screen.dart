
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 100, top: 150),
                    child: Column(
                      children: [
                        Text('Welcome back!', style: TextStyle(
                            fontSize: 35,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),),
                        Text('Log back into your account             ',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white
                          ),)
                      ],
                    ),

                  ),
                ),
                height: 300,
                decoration: BoxDecoration(
                    color: Color(0xff404F66),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70))

                ),
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,

                    labelText: "Your Email",
                    labelStyle: TextStyle(color: Colors.black,fontSize: 20),
                    hintText: "Enter your your Email",

                  ),


                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,


                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: Colors.black
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    CupertinoSwitch(
                      activeColor: Colors.blueGrey,
                      value: remember,
                      onChanged: (value) {
                        setState(() {
                          remember = value;
                        });
                      },
                    ),
                    // CupertinoSwitch(
                    //   value: remember,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       remember = value;
                    //       print(remember);
                    //     });
                    //   },
                    //   // activeTrackColor: Colors.white,
                    //   trackColor: Colors.red,
                    //   activeColor: Colors.blueGrey,
                    //
                    // ),
                    Text("Remember",style: TextStyle(
                      fontSize: 15,
                    )),
                    Spacer(),
                    GestureDetector(
                      child: Text(
                        "Forgot?",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: 40,),
              Container(
                color: Colors.black,
                height: 50,
                width: 250,
                child: TextButton(
                  onPressed: (){},
                  child: Text('LOG IN',style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),),
                ),

              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(
                    "Don’t have an account? ",
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                onTap: () {
                },
                child: Text(
                "Sign Up",
                style: TextStyle(
                fontSize: 17,
                color: Colors.red),
                ),
                ),
                ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}

