import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/admin/adminAccount/adminSignin.dart';
import 'package:resturants/main.dart';

import '../account/userSignin.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/images/bg.png"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('أشهى المأكولات',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: itemColor,fontSize: 25, fontFamily: 'reg', fontWeight: FontWeight.bold),),
                  Text(' تجدها هنا فقط اختر مطعمك المفضل',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontFamily: 'reg', fontWeight: FontWeight.bold),),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainColor,
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>userSignIn()));
                      },
                      child: Text(" إبدأ الآن",
                        style: TextStyle(fontSize: 20, fontFamily: 'reg', fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainColor,
                    ),
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>adminSignIn()));
                      },
                      child: Text(" إدارة التطبيق",
                        style: TextStyle(fontSize: 20, fontFamily: 'reg', fontWeight: FontWeight.bold,color: Colors.white),),
                    ),
                  ),

                ],
                ),
              ),
            ),

          ],
        ),

      ),
    ),);
  }
}
