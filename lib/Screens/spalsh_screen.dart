import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lect_list/main.dart';

class SplashScreen extends StatelessWidget {
  Navigation(context) async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (contxt){
      return MyApp();
    }),);
  }
  @override
  Widget build(BuildContext context) {
    Navigation(context);
    return Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }
}
