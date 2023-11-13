import 'package:flutter/material.dart';

class AlartBox extends StatelessWidget {
  const AlartBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog( 
        title: const Text('Alert'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Wrong Password or Username!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          
        ],
      );
  

    
  }
}
