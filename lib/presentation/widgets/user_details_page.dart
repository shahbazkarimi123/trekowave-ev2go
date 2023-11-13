import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  // ignore: constant_identifier_names
  static const USERDETAILS="userDetails";
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(height: MediaQuery.of(context).size.height*0.3,
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFF674AEF),
              blurRadius: 25.0,
              offset: Offset(0.5,0.75)
            )
          ],
          color: Color(0xFF674AEF),
          borderRadius: BorderRadius.only(bottomRight:Radius.circular(50) )
        ),),
        Container(height: MediaQuery.of(context).size.height*0.7,)

      ]),
    );
  }
}