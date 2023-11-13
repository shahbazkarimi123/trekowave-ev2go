import 'package:ev2go/presentation/pages/home.dart';
import 'package:ev2go/presentation/pages/maintaninence.dart';
import 'package:ev2go/presentation/pages/package.dart';
import 'package:ev2go/presentation/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NavigationPage extends StatefulWidget {
  
  static const String HOME =  "navigation";
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  List<Widget> childPage = <Widget>[
    
    const GridHomePage(),
    const Maintainence(),
    const Package()

    
    
  ];
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GNav(
              tabMargin: EdgeInsets.symmetric(horizontal: 10.w),            
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              iconSize: 25.sp,
              tabBorder: Border.all(color: Colors.grey, width: 1.w),
              tabBackgroundColor: Colors.grey.shade800,
              padding:const EdgeInsets.all(15),
              selectedIndex: _selectedIndex,
              onTabChange: (index){
                setState(() {
                  _selectedIndex = index;
    
                  
                  
                });
    
              },
              gap: 10,
              tabs:  const [
                GButton(icon: Icons.home,text: 'Home',),
                GButton(icon: Icons.engineering,text: 'Maintenance',),
                GButton(icon: Icons.inventory_2,text: 'Package',),
                // GButton(icon: Icons.settings,text: 'Settings',)
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFF674AEF),
        // appBar: AppBar(
          
        //   backgroundColor: Colors.black,
        //   centerTitle: true,
        //   title: Image.asset('assets/images/EV2GO-LOG0-10-11-22-1.png',fit: BoxFit.cover,),
        // ),
        
        body: SizedBox(
          
          
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          
          child: Column(
            
            
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  
                 
                  children: [
                    Expanded(
                      flex: 2,
                      
                      child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset('assets/images/EV2GO-LOG0-10-11-22-1.png',height: 50.h,))),
                    Expanded(
                      
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(onPressed: ()async{
                          SharedPreferences sharedPreferences;
                          sharedPreferences = await SharedPreferences.getInstance();
                          sharedPreferences.clear();
                          if(!context.mounted) return;
                          Navigator.of(context).pushReplacementNamed(LoginPage.LOGIN);
                          
                        }, 
                        icon: const Icon(Icons.logout,color: Colors.greenAccent,)),
                      ),
                    )
                  ],
                ),
              ),
            
            childPage[_selectedIndex],
            
          
          
          
          ]),
        ),
      ),
    );
  }
}