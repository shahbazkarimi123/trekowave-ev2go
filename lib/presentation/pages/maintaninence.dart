import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class Maintainence extends StatefulWidget {
  const Maintainence({super.key});

  @override
  State<Maintainence> createState() => _MaintainenceState();
}

class _MaintainenceState extends State<Maintainence> {
  Details item=Details(
    title: "Motor",
    // icons: const Icon(Icons.verified_user,color: Colors.greenAccent,size: 35,),
    icons: Image.asset('assets/logo/motor.png',height: 35.h,width: 35.w,),
    details: "dl25"

  );

  Details item1=Details(
    title: "Controller",
    icons: Image.asset('assets/logo/controller.png',height: 35.h,width: 35.w,),
    details: "123456789"

  );

  Details item2=Details(
    title: "Battery",
    icons: Image.asset('assets/logo/battery.png',height: 35.h,width: 35.w,),
    details: "bkpk54-black"

  );

  Details item3=Details(
    title: "Service",
    icons: Image.asset('assets/logo/service.png',height: 35.h,width: 35.w,),
    details: "one months"

  );

  Details item4=Details(
    title: "Horn",
    icons: Image.asset('assets/logo/horn.png',height: 35.h,width: 35.w,),
    details: DateTime.now().toString(),

  );

  Details item5=Details(
    title: "Light",
    icons: Image.asset('assets/logo/light.png',height: 35.h,width: 35.w,),
    details: DateTime.now().toString(),

  );

  Details item6=Details(
    title: "vehicalDetail",
    icons: Icon(Icons.directions_car,color: Colors.greenAccent,size: 35.sp),
    details: "land-fly"

  );

  
  @override
  Widget build(BuildContext context) {
    List<Details> detailsList = [item,item1,item2,item3,item4,item5,item6];
    return Flexible(
      child:  GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left:16.w,right: 16.w,bottom: 16.h,top: 16.h),
        crossAxisCount:2,
        mainAxisSpacing: 18,
        crossAxisSpacing: 18,
        children: detailsList.map((info){
          return Container(
            decoration: BoxDecoration(color: Colors.grey[700],
              boxShadow: const [
              BoxShadow(
                  color: Colors.black26,
                  offset: Offset(-10, -10),
                 blurRadius: 2),],

              borderRadius: BorderRadius.circular(15).r,
              border: Border.all(color: Colors.black))
            ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                info.icons!,
                SizedBox(height: 14.h,),
                Text(info.title!,style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )
                ),),
                
                const SizedBox(height: 14,),
                Text(info.details!,style: GoogleFonts.openSans(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600
                  )
                ),)
              ],
              
            ),
          );
        }).toList(),
        )
    
    );
  }
  
}

class Details{
  String? title;
  Widget? icons;
  String? details;
  
  Details({this.title,this.icons,this.details});
}
