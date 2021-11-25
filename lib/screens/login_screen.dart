
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_demo/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> _success;
  late Future<int> _id;
  late Future<String> _name;
  late Future<int> _phone;
  late Future<String> _imge;
  late Future<String> _token;

  get rsp => null;
  Future<void> _Savedata() async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool('_success', rsp.containsKey('success'));
    prefs.setInt('_id', rsp['data']['id']);
    prefs.setString('_name', rsp['data']['name']);
    prefs.setInt('_int', rsp['data']['phone']);
    prefs.setString('_imge', rsp['data']['imge']);
    prefs.setString('_token', rsp['data']['token']);

  }


  bool remember = false;
  bool _passwordVisible = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';
  String message1 = 'sai thong tin';

  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
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
                  Positioned(
                    bottom: 30,
                      right: 15,

                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text('LOGIN',style:
                        TextStyle(fontSize: 70,color: Color(0xff46546B)),),))


                ],
              ),
              Stack(
                children: [
                  Positioned(
                      top: 10,
                      right: 15,

                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text('NOW',style:
                        TextStyle(fontSize: 70,color: Color(0xffF7F7F7)),),)),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: TextFormField(
                            controller: emailController,
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
                            controller: passwordController,
                            keyboardType: TextInputType.text,

                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(vertical: 20),
                              floatingLabelBehavior: FloatingLabelBehavior.always,


                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.black
                              ),
                              suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  )),
                              // suffixIcon: GestureDetector(
                              //   child: Icon(
                              //     Icons.visibility,
                              //     color: Colors.black,
                              //   ),
                              // ),
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Container(
                color: Colors.black,
                height: 50,
                width: 250,
                child: TextButton(
                  onPressed: () async {

                    var loginkey = emailController.text;
                    var password = passwordController.text;
                    var rsp = await LoginUser(loginkey, password);
                    print(rsp);
                    if(rsp.containsKey('success')){
                      setState(() {
                        _Savedata();
                          message =rsp['data']['name'];
                          showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('Login Success'),
                                content: Text(message),
                              )
                          );
                        });
                      }
                    else {
                      setState(() {
                        message = 'sai thong tin';
                      });
                    }
                         },
                  child: Text('LOG IN',style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),),
                ),
              ),
              SizedBox(height: 10,),
              Text(message,style: TextStyle(color: Colors.red,
              fontSize: 20),
              ),
              SizedBox(height: 10,),
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

