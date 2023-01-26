import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:resturants/user/food.dart';
import 'package:resturants/user/homePage.dart';
import 'package:resturants/user/snacks.dart';

import '../main.dart';
import 'MyCard.dart';


class myDrink extends StatefulWidget {
  myDrink({Key? key}) : super(key: key);

  @override
  State<myDrink> createState() => _myDrinkState();
}
class _myDrinkState extends State<myDrink> {
  TextEditingController sr = new TextEditingController();
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
            IconButton(onPressed: (){}, icon:Icon(Icons.local_drink, color: Colors.white,)),
            Text('المشروبات',style: TextStyle(fontFamily: 'reg',fontWeight: FontWeight.bold),)
          ],


        ),
        backgroundColor: mainColor,
        leading:IconButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          },
            icon:Icon(Icons.home, color: itemColor,)),
      ),
      body: Column(
      children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height:580,
        child:ListView.builder(
            itemCount: myArray_drink.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context , int index){
              return
                drink(
                    drink_id: myArray_drink[index]["rest_id"].toString(),
                    drink_name: myArray_drink[index]["drink_name"].toString(),
                    rest_name:  myArray_drink[index]["rest_name"].toString(),
                    drink_image: myArray_drink[index]["drink_image"].toString(),
                    price: myArray_drink[index]["price"].toString(),);
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
                    color:  mainColor,

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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>mySnacks()));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 45,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: mainColor,

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


class drink extends StatelessWidget {
  final String drink_id;
  final String drink_name;
  final String rest_name;
  final String drink_image;
  final String price;
  drink({required this.drink_id, required this.drink_name, required this.rest_name, required this.drink_image, required this.price});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width:110,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal[50],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(drink_image),

              ),
            ),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(drink_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg'),),
              Text(rest_name, style: TextStyle(color: textColor , fontFamily: 'reg'),),
              Row(
                children: [
                  Text(price, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',color: itemColor),),
                  SizedBox(width: 10,),
                  Text('ج.م', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14, fontFamily: 'reg',color: itemColor),),
                  SizedBox(width: 30,),
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
