import 'dart:async';


import 'package:ev2go/presentation/pages/navigation_page.dart';
import 'package:ev2go/presentation/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;

class WelcomePage extends StatefulWidget {
  static const String welcome = "welcomPage";
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    
    getValidationData().whenComplete(() async {
      Timer(
          const Duration(milliseconds: 1500),
          () => Navigator.pushNamedAndRemoveUntil(
              context,
              finalEmail == null ? LoginPage.LOGIN : NavigationPage.HOME,
              (route) => false));
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtailEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtailEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(color: Colors.white),
          ),

          
          
          Container(
            height: MediaQuery.of(context).size.height / 1.8,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(80))),
            child: Center(
              child: Image.asset(
                'assets/images/EV2GO-LOG0-10-11-22-1.png',
                scale: 0.8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.25,
              decoration: const BoxDecoration(color: Color(0xFF674AEF)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.25,
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(70))),
              child: Column(
                children: <Widget>[
                  const Text(
                    'Drive Safe',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Anytime Everyware',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17, color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
