import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/user/MyCard.dart';
import 'package:resturants/user/drink.dart';
import 'package:resturants/user/food.dart';

import '../main.dart';
import 'homePage.dart';

class mySnacks extends StatelessWidget {
  mySnacks({Key? key}) : super(key: key);
  TextEditingController sr = new TextEditingController();

  var myArray_snack = [
    {
      "snack_id" : "1",
      "snack_name" : "غموس سبكترا",
      "rest_name":"سبكترا",
      "snack_image" : "assets/images/s1.jpg",
      "price": "99.99 "
    },

    {
      "snack_id" : "2",
      "snack_name" : "موتزاريلا مقلية",
      "rest_name":"روستو",
      "snack_image" : "assets/images/s2.jpg",
      "price": "95.99 "
    },
    {
      "snack_id" : "3",
      "snack_name" : "سلطة سيزر باستا",
      "rest_name":"مؤمن",
      "snack_image" : "assets/images/s3.jpg",
      "price": "109.99 "
    },
    {
      "snack_id" : "4",
      "snack_name" : "سلطة شيف سبكترا ",
      "rest_name":"سبكترا",
      "snack_image" : "assets/images/s4.jpg",
      "price": "139.99 "
    },
    {
      "snack_id" : "5",
      "snack_name" : "سلطة سلمون بالافوكادو ",
      "rest_name":"روستو",
      "snack_image" : "assets/images/s5.jpg",
      "price": "139.99 "
    },
    {
      "snack_id" : "6",
      "snack_name" : "سلطة جمبري ستير فراي",
      "rest_name":"روستو",
      "snack_image" : "assets/images/s6.jpg",
      "price": "149.99 "
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.fastfood, color: Colors.white,)),
            Text('المقبلات',style: TextStyle(fontFamily: 'reg',fontWeight: FontWeight.bold),)
          ],


        ),
        backgroundColor: mainColor,
        leading:IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            icon:Icon(Icons.home, color: itemColor,)),
      ),
      body:   Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height:580,
            child:ListView.builder(
                itemCount: myArray_snack.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context , int index){
                  return
                    snack(
                      snack_id: myArray_snack[index]["snack_id"].toString(),
                      snack_name: myArray_snack[index]["snack_name"].toString(),
                      rest_name:  myArray_snack[index]["rest_name"].toString(),
                      snack_image: myArray_snack[index]["snack_image"].toString(),
                      price: myArray_snack[index]["price"].toString(),);
                }),
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Row(

              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Food()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    height: 45,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: mainColor,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.food_bank_outlined,color: Colors.white),
                        Text('الطبق الرئيسي ',
                          style: TextStyle(fontFamily: 'reg', color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>myDrink()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 45,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:  mainColor,

                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.local_drink,color: Colors.white),
                        SizedBox(width: 5,),
                        Text('المشروبات ',
                          style: TextStyle(fontFamily: 'reg', color: Colors.white,fontWeight: FontWeight.bold,),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
     ),
    );
  }
}


class snack extends StatelessWidget {
  final String snack_id;
  final String snack_name;
  final String rest_name;
  final String snack_image;
  final String price;
  snack({required this.snack_id, required this.snack_name, required this.rest_name, required this.snack_image, required this.price});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            width:110,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal[50],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(snack_image),

              ),
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(snack_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg'),),
              Text(rest_name, style: TextStyle(color: textColor , fontFamily: 'reg'),),
              Row(
                children: [
                  Text(price, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',color: itemColor),),
                  SizedBox(width: 10,),
                  Text('ج.م', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',color: itemColor),),
                  SizedBox(width: 25,),
                  Container(
                    child: MaterialButton(
                      child: Text('تفاصيل' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',)),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCard()));
                      },
                    ),
                  )
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
