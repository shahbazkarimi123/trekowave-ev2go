import 'dart:convert';

import 'package:ev2go/presentation/screens/authentication/basic_details_screen.dart';
import 'package:ev2go/presentation/pages/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  // ignore: constant_identifier_names
  static const String LOGIN = "login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  bool _isLoading = false;
  // ignore: prefer_typing_uninitialized_variables
  var errorMsg;
  bool obscureText = true;

  // user login from http and authenticate
  login(String name, pass) async {
    //print("i am inside login function");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {"email": name, 'password': pass};
    // ignore: avoid_init_to_null
    var jsonResponse = null;

    //print(data);

    try {
      var url = Uri.parse(
          "https://goelectra-394508.el.r.appspot.com/api/admin/login");

      // print("uri loading");

      var response = await http.post(url, body: data);

      if (response.statusCode == 200) {
        //print('Status code '+response.statusCode.toString());
        jsonResponse = json.decode(response.body);
        //print(jsonResponse['name']);
        if (jsonResponse != null) {
          setState(() {
            _isLoading = false;
          });
          
          if (jsonResponse['company'] == "comp") {
            Fluttertoast.showToast(
              backgroundColor: const Color(0xFF674AEF),
              fontSize: 16,
                msg: "Welcome to Ev2Go", toastLength: Toast.LENGTH_SHORT);

            sharedPreferences.setString('email', name);
            sharedPreferences.setString(
                "phone", json.decode(response.body)['phone']);
            sharedPreferences.setInt("uid", json.decode(response.body)['pin']);
            //print("before navigator");
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
                context, NavigationPage.HOME, (route) => false);
          } else {
            Fluttertoast.showToast(
                msg: "Not A Valid User", toastLength: Toast.LENGTH_SHORT);
          }
        }
      } else {
        setState(() {
          _isLoading = false;
        });
        errorMsg = response.body;
        Fluttertoast.showToast(
            msg: "${json.decode(response.body)}",
            toastLength: Toast.LENGTH_SHORT,
            backgroundColor: const Color(0xFF674AEF),
            textColor: Colors.white);
        // ignore: avoid_print
        //print("The error message is: ${json.decode(response.body)}");
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(),toastLength: Toast.LENGTH_SHORT);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                // height: MediaQuery.of(context).size.height * 0.45,
                height: 0.45.sh,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color:const Color(0xFF674AEF),
                          blurRadius: 25.0.r,
                          offset:Offset(0.5, 0.75))
                    ],
                    color: const Color(0xFF674AEF),
                    borderRadius:
                        BorderRadius.only(bottomLeft: const Radius.circular(50).r)),
                child: SizedBox(
                  //height: MediaQuery.of(context).size.height * 0.18,
                 height: 168.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height * 0.15
                            top: 140.h
                            
                            ),
                        child: Image.asset(
                            'assets/images/EV2GO-LOG0-10-11-22-1.png'),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    // top: MediaQuery.of(context).size.height * 0.55,
                    top:0.55.sh,
                    left: 30.w,
                    right: 30.w),
                child: Column(children: <Widget>[
                  _userNameField(),
                  Padding(
                    padding: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height * 0.04,
                      
                      top:0.05.sh
                    ),
                    child: Column(children: <Widget>[
                      _passwordField(),
                      SizedBox(
                        // height: MediaQuery.of(context).size.height * 0.01,
                        height: 0.01.sh,
                        // height: 0.01.sh,
                      ),
                      Column(
                        children: [
                          Align(
                              alignment: Alignment.topRight,
                              child: TextButton(
                                  onPressed: () {
                                    // navigate to basic details page
                                    Navigator.pushNamed(
                                        context, BasicDetails.BASICDETAILS);
                                  },
                                  child:  Text(
                                    'New User? Create Account',
                                    style: TextStyle(
                                        color:const Color(0xFF674AEF), fontSize: 14.sp),
                                  ))),
                          SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.01,
                            height: 0.01.sh,
                          ),
                          Material(
                              elevation: 12.sp,
                              color: const Color(0xFF674AEF),
                              borderRadius: BorderRadius.circular(10),
                              child: InkWell(
                                  onTap: () {
                                    // ignore: avoid_print
                                    
                                    String userId = _idController.text.trim();
                                    String password =
                                        _passwordController.text.trim();
                                    
                                    if(userId.isEmpty){
                                      Fluttertoast.showToast(msg: "Enter User ID",toastLength: Toast.LENGTH_SHORT);
                                    }else if(password.isEmpty){
                                      Fluttertoast.showToast(msg: 'Enter Password',toastLength: Toast.LENGTH_SHORT);
                                    }else{
                                      
                //                       Navigator.pushNamedAndRemoveUntil(
                // context, NavigationPage.HOME, (route) => false);
                                      login(userId.toLowerCase(),
                                        password);
                                      
                                    }
                                    _idController.clear();
                                    _passwordController.clear();
                                  },
                                  child: _loginButton()))
                        ],
                      )
                    ]),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userNameField() {
    return Material(
      borderRadius: BorderRadius.circular(10).r,
      elevation: 12,
      child: TextField(
        controller: _idController,
        decoration: InputDecoration(
            icon: const Icon(Icons.person),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: 'User Id',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide:
                    const BorderSide(width: 1, color: Colors.transparent)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8).r,
            )),
      ),
    );
  }

  Widget _passwordField() {
    return Material(
      elevation: 12,
      borderRadius: BorderRadius.circular(10).r,
      child: TextField(
        obscureText: obscureText,
        controller: _passwordController,
        decoration: InputDecoration(
            suffixIcon: InkWell(
              child: const Icon(Icons.hide_source_sharp),
              onTap: () {
                setState(() {
                  obscureText = obscureText == false;
                });
              },
            ),
            icon: const Icon(Icons.security),
            fillColor: Colors.grey[200],
            filled: true,
            hintText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10).r,
                borderSide:
                    const BorderSide(width: 1, color: Colors.transparent)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8).r,
            )),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 80.w),
      child: Text(
        "Login",
        style: TextStyle(
            color: Colors.white,
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            wordSpacing: 2),
      ),
    );
  }
}
