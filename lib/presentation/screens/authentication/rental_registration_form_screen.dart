import 'dart:convert';

import 'package:ev2go/data/models/signup_data.dart';
import 'package:ev2go/presentation/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RentalRegistrationForm extends StatefulWidget {
  SignupData? signUpData;
  // ignore: constant_identifier_names
  static const String RENTALREGISTRATIONFORM = "rentalRegistrationForm";
  RentalRegistrationForm({super.key, this.signUpData});

  @override
  State<RentalRegistrationForm> createState() => _RentalRegistrationFormState();
}

class _RentalRegistrationFormState extends State<RentalRegistrationForm> {
  SignupData? _signupData;
  @override
  void initState() {
    
    _signupData = widget.signUpData;
    super.initState();
  }
  int i = 3;
  bool checkBox = false;

  final TextEditingController _mobileNo2 = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _guarantor1Name = TextEditingController();
  final TextEditingController _guarantor1Mobile = TextEditingController();
  final TextEditingController _guarantor1Address = TextEditingController();
  final TextEditingController _guarantorName2 = TextEditingController();
  final TextEditingController _guarantor2Mobile = TextEditingController();
  final TextEditingController _guarantor2Address = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
            height: MediaQuery.of(context).size.height * 0.9,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Step $i/3',
                      style: TextStyle(
                        color: Colors.yellow.shade800,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    'Rental Registration Form',
                    style: TextStyle(
                      color: Color(0xFF674AEF),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      wordSpacing: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),

                    //first first

                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _mobileNo2,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.phone),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Mobile Number 2',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        controller: _address,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.maps_home_work),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        controller: _guarantor1Name,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.man),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Guarantor 1 Name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _guarantor1Mobile,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.phone),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Guarantor 1 Mob No',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        controller: _guarantor1Address,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.home),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Guarantor 1 Address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        controller: _guarantorName2,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.man_2_outlined),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Guarantor Name 2',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: _guarantor2Mobile,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.phone),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Guarantor 2 Mob No',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 12,
                      child: TextField(
                        controller: _guarantor2Address,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.home),
                            fillColor: Colors.grey[200],
                            filled: true,
                            hintText: 'Guarantor 2 Address',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.transparent)),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2, color: Color(0xFF674AEF)),
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                            activeColor: const Color(0xFF674AEF),
                            value: checkBox,
                            onChanged: (checkBox) {
                              setState(() {
                                this.checkBox = checkBox!;
                              });
                            }),
                        const Text('Accept the Terms and Conditions')
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Material(
                        elevation: 12,
                        color: const Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 15,
                            ),
                            child: const Text(
                              'Back',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // save button
                      Material(
                          elevation: 12,
                          color: const Color(0xFF674AEF),
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                              onTap: () {
                                _signupData!.phoneNo2 =
                                    _mobileNo2.text.trim();
                                _signupData!.address =
                                    _address.text.trim();
                                _signupData!.guarantor1Name =
                                    _guarantor1Name.text.trim();
                                _signupData!.guarantor1PhNo =
                                    _guarantor1Mobile.text.trim();
                                _signupData!.guarantor1Address =
                                    _guarantor1Address.text.trim();
                                _signupData!.guarantor2Name =
                                    _guarantorName2.text.trim();
                                _signupData!.guarantor2PhNo =
                                    _guarantor2Mobile.text.trim();
                                _signupData!.guarantor2Address =
                                    _guarantor2Address.text.trim();
                                // cheking field if empty or not
                                if (_signupData!.phoneNo2!.isEmpty ||
                                    _signupData!.phoneNo2!.length != 10) {
                                  if (_signupData!.phoneNo2!.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: 'Enter Mobile Number 2',
                                        toastLength: Toast.LENGTH_SHORT);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Invalid Mobile Number',
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                } else if (_signupData!.address!.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Address',
                                      toastLength: Toast.LENGTH_SHORT);
                                } else if (_signupData!.guarantor1Name!.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Guarantor 1 Name',
                                      toastLength: Toast.LENGTH_SHORT);
                                } else if (_signupData!.guarantor1PhNo!.isEmpty ||
                                    _signupData!.guarantor1PhNo!.length !=
                                        10) {
                                  if (_signupData!.guarantor1PhNo!.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: 'Enter Guarantor 1 Mob No.',
                                        toastLength: Toast.LENGTH_SHORT);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Invalid Mobile Number',
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                } else if (_signupData!.guarantor1Address!.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Guarantor 1 Address',
                                      toastLength: Toast.LENGTH_SHORT);
                                } else if (_signupData!.guarantor2Name!.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Guarantor Name 2',
                                      toastLength: Toast.LENGTH_SHORT);
                                } else if (_signupData!.guarantor2PhNo!.isEmpty ||
                                    _signupData!.guarantor2PhNo!.length !=
                                        10) {
                                  if (_signupData!.guarantor2PhNo!.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: 'Enter Guarantor 2 Mob No',
                                        toastLength: Toast.LENGTH_SHORT);
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Invalid Mobile Number',
                                        toastLength: Toast.LENGTH_SHORT);
                                  }
                                } else if (_signupData!.guarantor2Address!.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: 'Enter Guarantor 2 Address',
                                      toastLength: Toast.LENGTH_SHORT);
                                } else {
                                  _addingImage();
                                }
                                
                                
                                //   _address.clear();
                                // _guarantor1Address.clear();
                                // _guarantor1Mobile.clear();
                                // _guarantor1Name.clear();
                                // _guarantor2Address.clear();
                                // _guarantor2Mobile.clear();
                                // _guarantorName2.clear();
                                // _mobileNo2.clear();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 60,
                                  vertical: 15,
                                ),
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )))
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.popAndPushNamed(context, 'login');
                    },
                    child: const Text(
                      'Already Have An Account? Sign In',
                      style: TextStyle(color: Color(0xFF674AEF)),
                    ),
                  ),
                ]),
          ),
          Container()
        ]),
      ),
    );
  }

  // _ignup() async {
  //   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // Map data = {

  //   // }
  // }

  _addingImage() async {
    try{
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://goelectra-394508.el.r.appspot.com/api/upload/addmultifiles'),

    );
    request.files.add(
      await http.MultipartFile.fromPath(
        "files",_signupData!.image0!.path
        )
    );
    request.files.add(
      await http.MultipartFile
        .fromPath("files",_signupData!.image1!.path)
    );

    request.files.add(
      await http.MultipartFile
      .fromPath("files",_signupData!.image2!.path)
    );

    request.files.add(
      await http.MultipartFile.fromPath("files", _signupData!.image3!.path)
    );

    request.files.add(
      await http.MultipartFile.fromPath("files", _signupData!.image4!.path)
    );

    request.files.add(
      await http.MultipartFile.fromPath("files", _signupData!.image5!.path)
    );

    request.files.add(
      await http.MultipartFile.fromPath("files", _signupData!.image6!.path)
    );

    request.files.add(
      await http.MultipartFile.fromPath("files", _signupData!.image7!.path)
    );
    request.headers.addAll({
      'Content-type':'multipart/form-data'
    });
    var iresponse = await request.send();
    var anotherResponse = await iresponse.stream.bytesToString();
    var decodedData = jsonDecode(anotherResponse);
    //print(decodedData);
    if(iresponse.statusCode==200){
      var image1 =
        decodedData['multi'][0];
      var image2 =
          decodedData['multi'][1];
      var image3 =
          decodedData['multi'][2];
      var image4 =
          decodedData['multi'][3];
      var image5 =
          decodedData['multi'][4];
      var image6 =
          decodedData['multi'][5];
      var image7 =
      decodedData['multi'][6];
      var image8 =
      decodedData['multi'][7];
    
      

      
      var url = Uri.parse("https://goelectra-394508.el.r.appspot.com/api/user/newuser");
      var response = await http.post(
        url,
        headers:{
          "Content-type": "application/json"
        },
        body: json.encode(
          {
            "name":_signupData!.userName!.toUpperCase(),
            "password":_signupData!.password,
            "phone": _signupData!.phone,
            "kycf":image1,
            "kycb":image2,
            "company": "Ev2Go",             
            "register":[
              {
                "selfie": image1,
                "idproof": image2,
                "driving": image3,
                "drivingback": image4,
                "voter": image5,
                "voterback": image6,
                "aadhar": image7,
                "aadharb": image8,
                "phone2":_signupData!.phoneNo2,
                "address":_signupData!.address,
                "gur1":_signupData!.guarantor1Name,
                "gur1no":_signupData!.guarantor1PhNo,
                "gur1address":_signupData!.guarantor1Address,
                "gur2":_signupData!.guarantor2Name,
                "gur2no":_signupData!.guarantor2PhNo,
                "gur2address":_signupData!.guarantor2Address
              }
            ],
            
          }
        )
      );
      if(response.statusCode == 200){
        //print("new user created => "+response.statusCode.toString());
        Fluttertoast.showToast(msg: "Added",toastLength:Toast.LENGTH_SHORT);
        // ignore: use_build_context_synchronously
        Navigator.pushNamedAndRemoveUntil(context, LoginPage.LOGIN, (route) => false);
      }
    }
    }catch (e){
      Fluttertoast.showToast(msg: e.toString(),toastLength: Toast.LENGTH_SHORT);

    }



  
  }

  // _addNewUser() async {
  //   var jsonResponse = null;
  //   var url =
  //       Uri.parse("https://goelectra-394508.el.r.appspot.com/api/user/newuser");
  //   var response = http.post(
  //     url,
  //     headers: {"Content-type": "application/json"},
  //     body: json.encode({
  //       "name":_signupData!.userName!.toUpperCase(),
  //       "password":_signupData!.password,
  //       "company":"Ev2Go",
  //       // "kycf":,

  //     }),
  //   );
  // } 
}
