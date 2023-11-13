// ignore_for_file: constant_identifier_names

import 'package:ev2go/data/models/signup_data.dart';
import 'package:ev2go/presentation/screens/authentication/id_proofs_screen.dart';
import 'package:ev2go/presentation/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BasicDetails extends StatefulWidget {
  static const String BASICDETAILS = "basicDetails";
  const BasicDetails({super.key});

  @override
  State<BasicDetails> createState() => _BasicDetailsState();
}

class _BasicDetailsState extends State<BasicDetails> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isChecked = false;
  //bool _isLoading = false;
  var errorMsg = "";
  bool obscureText = true;

  // Future getHttp() async {
  //   http.Response dresponse;
  //   var uri = Uri.parse(
  //       "https://goelectra-394508.el.r.appspot.com/api/superuser/getall");
  //   dresponse = await http.get(uri, headers: {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //   });
  //   setState(() {});
  // }

  //data posting
  //
  //

  bool status = false; //delete it is only for test
  // basicDetails(String userName, String phone, String password) async {
  //   try {
  //     var request = Uri.parse("http://192.168.1.13:3000/api/user/newuser");
  //     var response = await http.post(request, body: {
  //       'pin': "1243",
  //       'name': 'karimi',
  //       'username': userName,
  //       'phone': phone,
  //       'company': 'company1',
  //       'kycf': 'checking',
  //       'kycb': 'kyc-checking',
  //       'register': 'k434'
  //     });
  //     // print("status code "+response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       status = true;
  //       // ignore: avoid_print, prefer_interpolation_to_compose_strings
  //       print("body length " + response.body.length.toString());

  //       Navigator.pushNamed(context, IdProofs.IDPROOFS);
  //     }
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    int i = 1;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xFF674AEF),
                          blurRadius: 25.0,
                          offset: Offset(0.5, 0.75))
                    ],
                    color: Color(0xFF674AEF),
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50))),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * .18,
                    child:
                        Image.asset('assets/images/EV2GO-LOG0-10-11-22-1.png')),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.47,
                ),
                width: MediaQuery.of(context).size.width,
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Step $i/3',
                          style: TextStyle(
                              color: Colors.yellow.shade800,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'Basic Details',
                      style: TextStyle(
                        color: Color(0xFF674AEF),
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        wordSpacing: 2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 10,
                      child: TextField(
                        controller: _userNameController,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'User name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      left: 30,
                      right: 30,
                    ),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.phone),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: "Phone",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 30, right: 30),
                    child: Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(10),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              child: const Icon(Icons.hide_source_sharp),
                              onTap: () {
                                setState(() {
                                  obscureText = obscureText == false;
                                });
                              }),
                          icon: const Icon(Icons.security),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          fillColor: Colors.grey[200],
                          filled: true,
                          hintText: "Password",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (valueCheck) {
                              setState(() {
                                isChecked = valueCheck!;
                              });
                            }),
                        TextButton(
                          onPressed: () {
                            if (isChecked) {
                              Navigator.pushNamed(context,
                                  TermsAndConditions.TERMS_AND_CONDITIONS);
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'Accept the Terms and Conditions',
                                  toastLength: Toast.LENGTH_SHORT);
                            }
                          },
                          child: const Text(
                            'Accept the Terms and Conditions',
                          ),
                        )
                      ],
                    ),
                  ),
                  Material(
                    elevation: 10,
                    color: const Color(0xFF674AEF),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () async {
                        SignupData signUpData = SignupData();
                        signUpData.userName = _userNameController.text.trim();
                        signUpData.password = _passwordController.text.trim();
                        signUpData.phone = _phoneController.text.trim();
                        

                        if (signUpData.userName!.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter Name",
                              toastLength: Toast.LENGTH_SHORT);
                        } else if (isChecked == false) {
                          Fluttertoast.showToast(
                              msg: "Accept the Terms and Conditions",
                              toastLength: Toast.LENGTH_LONG);
                        } else if (signUpData.password!.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter Password",
                              toastLength: Toast.LENGTH_SHORT);
                        } else if (signUpData.phone.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Enter Phone No.",
                              toastLength: Toast.LENGTH_SHORT);
                        } else if (signUpData.phone.isNotEmpty) {
                          if (signUpData.phone.length < 10 ||
                              signUpData.phone.length > 11) {
                            Fluttertoast.showToast(
                                msg: 'Entered Phone No Is Less',
                                toastLength: Toast.LENGTH_SHORT);
                          }
                        }
                        if (signUpData.phone.isNotEmpty &&
                            signUpData.userName!.isNotEmpty &&
                            signUpData.password!.isNotEmpty &&
                            isChecked &&
                            signUpData.phone.length == 10) {
                          Navigator.pushNamed(context, IdProofs.IDPROOFS,
                              arguments: signUpData);
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        child: const Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Already Have An Account? Sign In',
                      style: TextStyle(color: Color(0xFF674AEF)),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.clear();
    _passwordController.clear();
    _phoneController.clear();
    super.dispose();
  }
}
