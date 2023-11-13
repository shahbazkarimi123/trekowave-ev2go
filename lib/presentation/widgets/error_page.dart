import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static final ERRORPAGE= 'errorPage';
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('something went wrong')),
    );
  }
}