import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import 'addCategory.dart';

class MyCategory extends StatefulWidget {
  @override
  State<MyCategory> createState() => _MyCategoryState();
}

class _MyCategoryState extends State<MyCategory> {

  var myOrder =[{
    "order_id" : "1",
    "order_name": "برياني",
    "order_qtn": "3",
    "order_price": "100",
    "order_image": "assets/images/1.jpg",
  },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/5.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
    {
      "order_id" : "1",
      "order_name": "برياني",
      "order_qtn": "3",
      "order_price": "100",
      "order_image": "assets/images/1.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("إضافة تصنيف", style: TextStyle(fontFamily: 'reg')),
        centerTitle: true,
      ),
      body: Stack(
          children: [
            Container(
              height: 800,
              margin: EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: myOrder.length,
                itemBuilder: (context, index ){
                  return singleOrder(
                    order_id: myOrder[index]["order_id"].toString(),
                    order_name: myOrder[index]["order_name"].toString(),
                    order_price: myOrder[index]["order_price"].toString(),
                    order_qtn: myOrder[index]["order_qtn"].toString(),
                    order_image: myOrder[index]["order_image"].toString(),);
                },

              ),
            ),
       ]
      ),
      bottomNavigationBar: Container(

        child: GestureDetector(
          onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addCategory()));
          },
          child: Row(
            crossAxisAlignment:CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_box,color: itemColor,),
              SizedBox(width: 10,),
              Text('إضافة تصنيف جديد ', style: TextStyle(fontSize: 17,color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'reg'),),



            ],
          ),
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
class singleOrder extends StatelessWidget {
  final String order_id;
  final String order_name;
  final String order_price;
  final String order_qtn;
  final String order_image;
  singleOrder({required this.order_id, required this.order_name, required this.order_price, required this.order_qtn, required this.order_image});

  @override
  Widget build(BuildContext context) {
    return Card(

      child: Column(
        children: [
          SingleChildScrollView(
            child: Container(
              child: ListTile(
                title: Text(order_name, style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(order_price),
                leading: Container(
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(order_image),
                        fit: BoxFit.cover
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                trailing: Container(
                  width: 70,
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(

                          padding: EdgeInsets.all(7),
                          child: FaIcon(Icons.edit, color: Colors.white,size: 16,),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),

                      ),
                      Expanded(child: Text('')),
                      GestureDetector(
                        child: Container(

                          padding: EdgeInsets.all(7),
                          child: Icon(Icons.delete, color: Colors.white,size: 16,),
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),

                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}