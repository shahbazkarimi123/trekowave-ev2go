// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:ev2go/presentation/widgets/device_details.dart';
import 'package:ev2go/presentation/widgets/package_details.dart';
import 'package:ev2go/presentation/widgets/package_end_details.dart';
import 'package:ev2go/presentation/widgets/package_state_details.dart';
import 'package:ev2go/presentation/widgets/user_details_page.dart';
import 'package:ev2go/presentation/widgets/vehicle_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GridHomePage extends StatefulWidget {
  const GridHomePage({super.key});

  @override
  State<GridHomePage> createState() => _GridHomePageState();
}

class _GridHomePageState extends State<GridHomePage> {
  SharedPreferences? sharedPreferences;
  PageController? _myPage;
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  DateTime now = DateTime.now();
  String? id;
  var did = "";
  String dropdownvalue = 'Total';
  String userName = "";
  int touchedIndex = -1;
  String deviceType="";
  String packageStartDate="";
  String packageEndDate = "";
  String packageDetailsKM="";
  
  var moving;
  var stop;
  var items = [
    'Total',
    'Daily',
    'Weekly',
    'Monthly',
  ];
  var productdetails;
  var superdetails;
  var bannerdetails;
  var   graphdetails;
  var catdetails;
  var locdetails;
  String s ='';
  String e = '';


  dynamic date(date){
    if(date!=null){
      var s = DateTime.fromMillisecondsSinceEpoch(date);

      return s;
    }else{

      return 'invalid';
    }


  }

    Future getHttp() async {
      sharedPreferences = await SharedPreferences.getInstance();
      int? id = sharedPreferences!.getInt("uid");
      String formatted = formatter.format(now);
      http.Response sresponse;
      sresponse = await http.get(
          Uri.parse(
              'https://goelectra-394508.el.r.appspot.com/api/trips/getall'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      http.Response bresponse;
      bresponse = await http.get(
          Uri.parse(
              'https://goelectra-394508.el.r.appspot.com/api/images/getbanners'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      http.Response tresponse;
      tresponse = await http.get(
          Uri.parse(
              'https://goelectra-394508.el.r.appspot.com/api/admin/getprofile?id=6344f3900db2dc512670cfcd'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });
      http.Response dresponse;

      dresponse = await http.get(
          Uri.parse(
              'https://goelectra-394508.el.r.appspot.com/api/user/getprofile?id=${id!}'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          });

      items = [];
      int len;
      try{
        len = json.decode(dresponse.body)['devices']!.length;
      }catch(e){
        print(e);
        len = 0;
      }
      
      
      for (int i = 0; i <len; i++) {
        items.add(json.decode(dresponse.body)['devices'][i]['id']);
      }
      //print(items.toString());
      setState(() {
        did = json.decode(dresponse.body)!['deviceid'];
        dropdownvalue = json.decode(dresponse.body)['deviceid'];
        userName = json.decode(dresponse.body)['name'];
        //mob = json.decode(dresponse.body)['phone'];
        deviceType = json.decode(dresponse.body)['devicetype'];
        packageStartDate = json.decode(sresponse.body)['tstart'];
        packageEndDate = json.decode(sresponse.body)['tend'];
        packageDetailsKM=json.decode(sresponse.body)['nkms'];

        sharedPreferences!
            .setString('type', json.decode(dresponse.body)['vehicletype']);
        sharedPreferences!
            .setString('did', json.decode(dresponse.body)['deviceid']);
      });

      Map body = {
        "username": "Onyx",
        "deviceids": [did]
      };

      http.Response lresponse;
      lresponse = await (http.post(
          Uri.parse('https://gps51.com:8443/webapi?action=lastposition&token=' +
              json.decode(tresponse.body)['licproducts'][0]),
          body: json.encode(body)));

      http.Response presponse;
      presponse = await (http.get(
          Uri.parse(
              'https://goelectra-394508.el.r.appspot.com/api/vehicles/getall'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
          }));

      http.Response caresponse;
      caresponse = await (http.get(
          Uri.parse(
              'https://goelectra-394508.el.r.appspot.com/api/category/getcategories'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          }));
      s = formatted;
      e = formatted;

      Map gbody = {
        "startday": formatted,
        "endday": formatted,
        "offset": 8,
        "deviceids": [did],
        "limitspeed": 5,
        "reporttype": 0
      };

      http.Response gresponse;
      gresponse = await (http.post(
        Uri.parse(
            'https://gps51.com:8443/webapi?action=reportdrivingrecord&token=' +
                json.decode(tresponse.body)['licproducts'][0]),
        body: json.encode(gbody),
      ));
      setState(() {
        productdetails = json.decode(presponse.body);
        bannerdetails = json.decode(bresponse.body);
        superdetails = json.decode(sresponse.body);
        graphdetails = json.decode(gresponse.body)['summaries'];
        catdetails = json.decode(caresponse.body);
        locdetails = json.decode(lresponse.body)['records'];

        //print(graphdetails);

        if (graphdetails[0]['endtime'] == "-") {
          moving = 0;
          stop = 100;
        } else {
          var w = date(graphdetails[0]['endtime'])
              .difference(date(graphdetails[0]['starttime']))
              .inHours;

          moving = ((w) / 24) * 100;
          stop = 100 - moving;
          //print(moving);
        }

        // var w = currentTime.difference(startTime).inDays;
      });
    }
    @override
  void initState() {
    super.initState();
    getHttp();
    _myPage = PageController(initialPage: 1);
  }
  @override
  Widget build(BuildContext context) {
    
    List<String> details = [
      "User id",
      // "MOB",
      "Device Detail",
      "Package Detail(Km)",
      "Package Start Date",
      "Package End Date",
      "Vehicle Detail",
      // "Customer Detail",
      //"Insurance Sorf Copy",
    ];
    // List<Widget> detailsFromDB=[
    //   Text(userName),
    //   //Text(mob),
    //   Text(deviceType),
    //   Text(packageDetailsKM),
    //   Text(packageStartDate),
    //   Text(packageEndDate),
    //   const Text('vehicalDetail'),

      

    // ];

    List<Icon> icon = [
      Icon(
        Icons.verified_user,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.phone,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.perm_device_info,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.shopping_cart,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.date_range,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.send_to_mobile,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.directions_car,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.man,
        color: Colors.white,
        size: 30.sp,
      ),
      Icon(
        Icons.document_scanner,
        color: Colors.white,
        size: 30.sp,
      ),
    ];
    List allRoute=[
      UserDetails.USERDETAILS,
      DeviceDetails.DEVICE_DETAILS,
      PackageDetails.PACKAGE_DETAILS,
      PackageStartDetails.PACKAGE_STATR_DETAILS,
      PackageEndDetails.PACKAGE_END_DETAILS,
      VehicleDetails.VEHICLE_DETAILS,      
    ];
    

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        // height: MediaQuery.of(context).size.height * 0.822,
        height: 0.822.sh,
        child: ListView(
          children: <Widget>[
            Container(
              
              padding: EdgeInsets.only(
                  top: 15.h, left: 15.w, right: 15.w, bottom: 15.h),
              decoration: BoxDecoration(               
                  boxShadow: const <BoxShadow>[
                    
                    BoxShadow(
                      color: Color(0xFF674AEF),
                      blurRadius: 8.0,
                      offset: Offset(0.0, 0.75),
                    )
                  ],
                  color:const Color(0xff674aef),
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(20).r,
                    bottomRight:const Radius.circular(20).r,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.dashboard,
                        size: 30.sp,
                        color: Colors.white,
                      ),
                      Container(
                          padding: EdgeInsets.only(right: 10.w),
                          height: 50.h,
                          width: 50.w,
                          child: InkWell(
                              onTap: () {
                                
                              
                                // print("height = ${MediaQuery.of(context).size.height}");
                                // print("width = ${MediaQuery.of(context).size.width}");
                                Fluttertoast.showToast(
                                    msg: "No Message",
                                    toastLength: Toast.LENGTH_SHORT);
                              },
                              child: Image.asset(
                                'assets/logo/whatsappicon.png',
                              )))
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 3,bottom: 15),
                  //   child: Image.asset('assets/images/EV2GO-LOG0-10-11-22-1.png',height: 100,width: ,)
                  // ),
                  Container(
                    margin: EdgeInsets.only(top: 5.h, bottom: 20.h),
                    width: MediaQuery.of(context).size.width,
                    height: 55.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10).r),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2),
                    child: Column(children: <Widget>[
                      GridView.builder(
                          itemCount: details.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio:
                                MediaQuery.of(context).size.width / 0.5.sh,
                                    
                            crossAxisSpacing: 1,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                
                                Navigator.pushNamed(context, allRoute[index]);
                               
                              },
                              child: Container(
                                margin: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                    boxShadow: const <BoxShadow>[
                                      BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 7.0,
                                        offset: Offset(0.0, 0.7),
                                      )
                                    ],
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(15).r,
                                    ),
                                    color: Colors.grey[300]),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      icon[index],
                                      Text(
                                        details[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.sp),
                                      ),
                                      


                                    ]),
                              ),
                            );
                          })
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
