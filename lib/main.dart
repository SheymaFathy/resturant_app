import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:resturants/account/userSignin.dart';
import 'package:resturants/startScreens/splashScreen.dart';
import 'package:resturants/startScreens/start.dart';

Color mainColor = Color(0xff0a8791);
Color textColorActive = Color(0xff0e122b);
Color textColor = Color(0xffc2c2cb);
Color itemColor = Color(0xfffba83c);
Color lightColor = Color(0xffe3e7fb);
late final Position currentPosition;
late final Position destination;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(resturantApp());
}

class resturantApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

      ),
      home: splashScreen(),
    );
  }
}