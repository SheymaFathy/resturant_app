import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/main.dart';
import 'package:resturants/startScreens/start.dart';
import 'package:splashscreen/splashscreen.dart';


class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds:5,
      navigateAfterSeconds: new StartPage(),
      title: new Text(
        textAlign: TextAlign.center,
        'مرحباً بكم في تطبيق مطاعم',
        style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, fontFamily: 'reg',color: Colors.white),
      ),


      backgroundColor: mainColor,
      loaderColor: Colors.orange,
    );
  }
}
