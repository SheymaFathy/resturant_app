import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../main.dart';

class finalCard extends StatefulWidget {
  @override
  State<finalCard> createState() => _finalCardState();
}

class _finalCardState extends State<finalCard> {
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


        ],
      ),
    );
  }
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
 ];

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
      backgroundColor: Colors.grey[50],
      body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
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
            Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              height: 120.0,
              child: myHeader(),),
          ]
      ),
      bottomNavigationBar: Container(

        child: GestureDetector(
          onTap: (){},
          child: Row(
            crossAxisAlignment:CrossAxisAlignment.center ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart,color: itemColor,),
              SizedBox(width: 5,),
              Text('إضافة الى السلة ', style: TextStyle(fontSize: 15,color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'reg'),),
            Expanded(child: Text('')
            ),
              Text('المجموع', style: TextStyle(fontSize:13, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'reg'),),
              Padding(padding: EdgeInsets.all(3)),
              Text('200', style: TextStyle(fontSize: 13,color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'reg'),),


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
    return Container(
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
          width: 100,
          child: Row(
            children: [
              GestureDetector(
                child: Container(

                  padding: EdgeInsets.all(5),
                  child: FaIcon(FontAwesomeIcons.plus, color: Colors.white,size: 16,),
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),

              ),
              Expanded(child: Text(order_qtn, style:
              TextStyle(fontSize: 20),
                textAlign: TextAlign.center)),
              GestureDetector(
                child: Container(

                  padding: EdgeInsets.all(5),
                  child: FaIcon(FontAwesomeIcons.minus,color: Colors.white,size: 16,),
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
    );
  }
}

