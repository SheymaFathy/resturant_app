import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../main.dart';
import 'finalCard.dart';

class MyCard extends StatefulWidget {
  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  Widget myHeader(){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(
                color: Colors.grey,
                spreadRadius:1,
                blurRadius: 2,
                offset: Offset(0,2),
              )],
              borderRadius: BorderRadius.circular(15),
            ),
              child: IconButton(onPressed: (){
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back, color: itemColor,))),
          Expanded(child: Text("")),
          //..............shop card
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  spreadRadius:1,
                  blurRadius: 1,
                  offset: Offset(0,1),
                )],
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>finalCard()));
              }, icon: Icon(Icons.shopping_cart, color: itemColor,))),

        ],
      ),
    );
  }
  Widget mealImage(){
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          spreadRadius: 2,
          blurRadius: 2,
          offset: Offset(0,2),
          color: Colors.grey,
        ),],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/2.jpg'),
          Padding(padding: EdgeInsets.only(top: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      spreadRadius:1,
                      blurRadius: 2,
                      offset: Offset(0,2),
                    )],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(onPressed: (){},
                    icon: FaIcon(
                      FontAwesomeIcons.plus,
                      color: Colors.white,
                    ),
                  ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text('1',style: TextStyle(fontWeight: FontWeight.bold,color: textColorActive,fontSize: 25),),
              ),
              //..............shop card
              Container(
                  decoration: BoxDecoration(
                    color: mainColor,
                    boxShadow: [BoxShadow(
                      color: Colors.grey,
                      spreadRadius:1,
                      blurRadius: 1,
                      offset: Offset(0,1),
                    )],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(onPressed: (){},
                    icon: FaIcon(
                      FontAwesomeIcons.minus,
                      color: Colors.white,
                    ),
                  ),
              ),

            ],
          ),

        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
        children: [
          ListView(
          children: [

             mealImage(),

            Container(
              padding: EdgeInsets.all(25),
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('برياني', style: TextStyle(fontSize: 30, fontFamily: 'reg', fontWeight: FontWeight.bold, color: textColorActive),),
                Row(
                  children: [
                    Icon(Icons.favorite,color: Colors.red,),
                    Text('  المفضلات', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'reg'),),
                    Expanded(child: Text(''),),
                    Icon(Icons.star, color: itemColor,size: 30,),
                    Text('  التقييم', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'reg'),),
                  ],
                ),
                Text('البرياني هو طبق من اللحم والخضروات المطهية مع الأرز والذي تُستخدم في طهيه خلطة بهـارات البرياني الهندية',
                  style: TextStyle(fontSize: 16, fontFamily: 'reg', color: textColor),),
              ],
            ))

          ],
        ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: 120.0,
            child: myHeader(),),
        ]
      ),
        bottomNavigationBar: Container(
          child: Row(
            children: [
              Text('LE 15  ',style: TextStyle(fontSize: 15,color: Colors.white, fontFamily: 'reg', fontWeight: FontWeight.bold),),
              Expanded(child: Text('')),
              Container(child: Text(' أضف للسلة',style: TextStyle(fontSize: 15,color: Colors.white, fontFamily: 'reg', fontWeight: FontWeight.bold),),),
              SizedBox(width: 5,),
              Container(child: Icon(Icons.add_shopping_cart, color: itemColor,size: 30,),),
            ],
          ),
          padding: EdgeInsets.only(right: 50 , left: 50,),
          margin: EdgeInsets.only(bottom: 5),
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: mainColor,
            boxShadow: [BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              offset: Offset(0,2),
              blurRadius: 2,
            )]
          ),
        ),
      ),

    );
  }
}
