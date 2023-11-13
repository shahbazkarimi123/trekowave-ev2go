import 'dart:convert';

import 'package:ev2go/data/models/signup_data.dart';
import 'package:ev2go/data/register_data.dart';
import 'package:ev2go/presentation/pages/recharge_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Package extends StatefulWidget {
  const Package({super.key});

  @override
  State<Package> createState() => _PackageState();
}

class _PackageState extends State<Package> {
  PageController? _myPage;
  String activePlan = "";
  int extra = 0;
  String activeDay = "";
  String activeAmount = "";
  var productdetails;
  bool currentPlan = false;
  List package = [];
  SharedPreferences? sharedPreferences;

  Future getHttp() async{
    sharedPreferences = await SharedPreferences.getInstance();
    int? id = sharedPreferences!.getInt("uid");
    print(id);

    
    try{
      http.Response response;
    response = await (http.get(
        Uri.parse(
            'https://goelectra-394508.el.r.appspot.com/api/user/getprofile?id=${id!.toString()}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
      http.Response caresponse;
    caresponse = await (http.get(
        Uri.parse(
            'https://goelectra-394508.el.r.appspot.com/api/packages/getbanners'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }));
        setState(() {
      productdetails = json.decode(caresponse.body);
      package = json.decode(response.body)['packages'];
    });
    }catch(e){
      print(e);
    }
  }
  @override
  void initState() {
    super.initState();
    
    getHttp();
    _myPage = PageController(initialPage: 1);
  }
  expdays( expdate){
    var startTime = DateTime.parse(expdate);// TODO: change this to your DateTime from firebase
    var currentTime = DateTime.now();
    var diff = startTime.difference(currentTime).inDays; // HINT: you can use .inDays, inHours, .inMinutes or .inSeconds according to your need.

     if(diff >0){
       extra = diff;
       return diff;
     }else {
       return 0;
     }
  }
  @override
  Widget build(BuildContext context) {
    RechargeInfo? rechargeInfo;
    return Container(
      color: Colors.white,
      // height: MediaQuery.of(context).size.height * 0.822,
      height: 0.822.sh,
      child: Stack(children: [
        Container(
          // height: MediaQuery.of(context).size.height * 0.1,
          height: 0.1.sh,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color(0xFF674AEF),
                    blurRadius: 25.0,
                    offset: Offset(0.5, 0.75))
              ],
              color:const Color(0xFF674AEF),
              borderRadius:
                  BorderRadius.only(bottomRight: const Radius.circular(50).r)),
          child: Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Text(
              "Package",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(
                
                top:0.133.sh,
              
              left: 15.w),
          // height: MediaQuery.of(context).size.height * 0.232,
          height: 0.232.sh,
          color: const Color.fromRGBO(255, 255, 255, 1),
          child: Column(
            children: <Widget>[
            
              Align(
                alignment: Alignment.center,
                child: Text("Your Package",style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color:const Color.fromARGB(255, 118, 133, 158),))),
              SizedBox(height: 6.h,),
              SingleChildScrollView(
                child: package.isEmpty? Container(
                  //width: MediaQuery.of(context).size.width * 0.29,
                  width: 0.29.sw,
                  padding: EdgeInsets.only(top: 50.h, right: 10.w, left: 10.w, bottom: 70.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: const Offset(-20, -20),
                          blurRadius: 40.r),
                      // BoxShadow(
                      //   color: Colors.white,
                      //   offset: Offset(-20,-20),
                      //   blurRadius: 25
                      // )
                    ],
                    borderRadius: BorderRadius.only(topRight: const Radius.circular(40).r),
                  ),
                  child: const Text(
                                "Empty ! Buy Now" ,textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xffff6666),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                        
                      //later afer data is provided
                ):ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: package.length,
                  itemBuilder: (BuildContext context,int index){
                    return GestureDetector(
                      onTap:()async{

                      }
                    );
                  },
                  )
              ),
            ],
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(
                top: 0.37.sh
              ),
          child: Column(children: <Widget>[
            Text(
              "Packages",
              //textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 118, 133, 158)),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                boxWidget("One day Plan", "1","300","0"),
                boxWidget("One Week Plan", "7", "2100","1"),
                boxWidget("Fortnight Plan", "15", "4000","2")
              ],
            ),
            SizedBox(
              height: 0.05.sh,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                boxWidget("One Month Plan", "30","7800","3"),
                boxWidget("One Month Special Vehicle Plan", "30","9000","4"),
              ],
            )
          ]),
        )
      ]),
    );
  }

  Widget boxWidget(String plan, String day, String amount,String index) {
    return InkWell(
        onTap: () {
          RechargeData rechargeData = RechargeData(amount:amount,index:index,plan: day);
          Navigator.pushNamed(context, RechargeRequest.RECHARGEREQUEST,arguments: rechargeData);
          setState(() {
            activePlan = plan;
            activeAmount = amount;
            activeDay = day;
          });
        },
        child: Container(
          width: 0.29.sw,
          padding: const EdgeInsets.only(top: 35, right: 10, left: 10, bottom: 15),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-20, -20),
                  blurRadius: 40),
              
            ],
            borderRadius: BorderRadius.only(topRight: Radius.circular(40)),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  plan,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 151, 164, 185),
                    fontSize: 15,
                    fontWeight: FontWeight.w900,
                    
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "Days $day",textAlign: TextAlign.center,
                  style: const TextStyle(color: Color(0xff789DF9)),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  '₹ $amount',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xffff6666), fontWeight: FontWeight.w500),
                ),
              ]),
        ));
  }
}
