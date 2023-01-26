import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/user/drink.dart';
import 'package:resturants/user/homePage.dart';
import 'package:resturants/user/snacks.dart';

import '../main.dart';
import 'MyCard.dart';


class Food extends StatelessWidget {
  Food({Key? key}) : super(key: key);
  TextEditingController sr = new TextEditingController();
  var myArray_meal = [
  {
    "meal_id" : "1",
    "meal_name" : "شرائح دجاج",
    "rest_name":"وينجز",
    "meal_image" : "assets/images/1.jpg",
    "price": "85"
  },

    {
      "meal_id" : "2",
      "meal_name" : "برياني",
      "rest_name":"روستو",
      "meal_image" : "assets/images/2.jpg",
      "price": "60"
    },
    {
      "meal_id" : "3",
      "meal_name" : "شيش طاووق مشوى",
      "rest_name":"مؤمن",
      "meal_image" : "assets/images/3.jpg",
      "price": "65"
    },
    {
      "meal_id" : "4",
      "meal_name" : "كرسبى",
      "rest_name":"كنتاكي",
      "meal_image" : "assets/images/4.jpg",
      "price": "80"
    },
    {
      "meal_id" : "5",
      "meal_name" : "سمك فيليه",
      "rest_name":"روستو",
      "meal_image" : "assets/images/5.jpg",
      "price": "55"
    },
    {
      "meal_id" : "6",
      "meal_name" : "سمك اسكالوب",
      "rest_name":"روستو",
      "meal_image" : "assets/images/6.jpg",
      "price": "70"
    },

    {
      "meal_id" : "1",
      "meal_name" : "شرائح دجاج",
      "rest_name":"وينجز",
      "meal_image" : "assets/images/1.jpg",
      "price": "85"
    },

    {
      "meal_id" : "2",
      "meal_name" : "برياني",
      "rest_name":"روستو",
      "meal_image" : "assets/images/2.jpg",
      "price": "60"
    },
    {
      "meal_id" : "3",
      "meal_name" : "شيش طاووق مشوى",
      "rest_name":"مؤمن",
      "meal_image" : "assets/images/3.jpg",
      "price": "65"
    },
    {
      "meal_id" : "4",
      "meal_name" : "كرسبى",
      "rest_name":"كنتاكي",
      "meal_image" : "assets/images/4.jpg",
      "price": "80"
    },
    {
      "meal_id" : "5",
      "meal_name" : "سمك فيليه",
      "rest_name":"روستو",
      "meal_image" : "assets/images/5.jpg",
      "price": "55"
    },
    {
      "meal_id" : "6",
      "meal_name" : "سمك اسكالوب",
      "rest_name":"روستو",
      "meal_image" : "assets/images/6.jpg",
      "price": "70"
    },
  ];
  var myArray_drink = [
    {
      "drink_id" : "1",
      "drink_name" : "لاتيه مثلج",
      "rest_name":"وينجز",
      "drink_image" : "assets/images/d1.jpg",
      "price": "39.99 "
    },

    {
      "drink_id" : "2",
      "drink_name" : "موكا مثلجة",
      "rest_name":"روستو",
      "drink_image" : "assets/images/d2.jpg",
      "price": "45.99 "
    },
    {
      "drink_id" : "3",
      "drink_name" : "كابتشينو",
      "rest_name":"مؤمن",
      "drink_image" : "assets/images/d3.jpg",
      "price": "45.99 "
    },
    {
      "drink_id" : "4",
      "drink_name" : "عصير مانجو ",
      "rest_name":"كنتاكي",
      "drink_image" : "assets/images/d4.jpg",
      "price": "45.99 "
    },
    {
      "drink_id" : "5",
      "drink_name" : "عصير افوكادو",
      "rest_name":"روستو",
      "drink_image" : "assets/images/d5.jpg",
      "price": "55.99 "
    },
    {
      "drink_id" : "6",
      "drink_name" : "عصير ليمون بنعناع ",
      "rest_name":"روستو",
      "drink_image" : "assets/images/d6.jpg",
      "price": "39.99 "
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
            IconButton(onPressed: (){}, icon:Icon(Icons.food_bank_outlined, color: Colors.white,)),
            Text('الأطباق الرئيسية',style: TextStyle(fontFamily: 'reg',fontWeight: FontWeight.bold),)
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
            child: ListView.builder(
                itemCount: myArray_meal.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context , int index){
                  return
                    meal(
                      meal_id:myArray_meal[index]["meal_id"].toString(),
                      meal_name:myArray_meal[index]["meal_name"].toString(),
                      rest_name: myArray_meal[index]["rest_name"].toString(),
                      meal_image:myArray_meal[index]["meal_image"].toString(),
                      price: myArray_meal[index]["price"].toString(),
                    );
                }),
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Row(

              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>myDrink()));
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
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
                        Text('المشروبات ',
                          style: TextStyle(fontFamily: 'reg', color: Colors.white,fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>mySnacks()));
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
                        Icon(Icons.fastfood,color: Colors.white),
                        SizedBox(width: 5,),
                        Text('المقبلات ',
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

class meal extends StatelessWidget {
  final String meal_id;
  final String meal_name;
  final String rest_name;
  final String meal_image;
  final String price;
  meal({required this.meal_id, required this.meal_name, required this.rest_name, required this.meal_image, required this.price});
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
                image: AssetImage(meal_image),

              ),
            ),
          ),
          SizedBox(width: 20,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(meal_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg'),),
             Text(rest_name, style: TextStyle(color: textColor , fontFamily: 'reg'),),
             Row(
               children: [
                 Text(price, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',color: itemColor),),
                 SizedBox(width: 10,),
                 Text('ج.م', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',color: itemColor),),
                 SizedBox(width: 50,),
                 Container(
                   child: MaterialButton(
                     child: Text('تفاصيل' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, fontFamily: 'reg',)),
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

