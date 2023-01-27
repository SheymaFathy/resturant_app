
import 'package:flutter/material.dart';
import 'package:resturants/drawer/drawer.dart';
import 'package:resturants/user/food.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController sr = TextEditingController();
  final GlobalKey<ScaffoldState> _keyDrawer = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  var myArray_cat = [
    {
      "cat_id" : "1",
      "cat_name" : "المطبخ الايطالي",
      "cat_image" : "assets/cat/itali.jpg",},
    {
      "cat_id" : "2",
      "cat_name" : "وجبات سريعة",
      "cat_image" : "assets/cat/qwq.jpg",},
    {
      "cat_id" : "3",
      "cat_name" : "مأكولات بحرية",
      "cat_image" : "assets/cat/sea.jpg",},
    {
      "cat_id" : "4",
      "cat_name" : "بيتزا",
      "cat_image" : "assets/cat/pizzaa.png",},
    {
      "cat_id" : "5",
      "cat_name" : "أطباق شرقية",
      "cat_image" : "assets/cat/eastt.jpg",},
  ];
  var  myArray_rest =[
    {
    "rest_id" : "1",
    "rest_name" : "ماكدونالدز",
    "rest_dec" : "وجبات سريعة",
    "rest_image" : "assets/logo/macc.jpeg",},
    {
      "rest_id" : "2",
      "rest_name" : "كنتاكي",
      "rest_dec" : "وجبات سريعة",
      "rest_image" : "assets/logo/kfcc.jpg",},
    {
      "rest_id" : "3",
      "rest_name" : "مؤمن",
      "rest_name" : "مؤمن",
      "rest_dec" : "وجبات سريعة",
      "rest_image" : "assets/logo/momm.jpg",},
    {
      "rest_id" : "4",
      "rest_name" : "وينجز",
      "rest_dec" : "أطباق شرقية",
      "rest_image" : "assets/logo/win.jpg",},
    {
      "rest_id" : "5",
      "rest_name" : "روستو",
      "rest_dec" : "أطباق شرقية",
      "rest_image" : "assets/logo/rostoo.jpg",},
    {
      "rest_id" : "6",
      "rest_name" : "سبيكترا",
      "rest_dec" : "المطبخ الإيطالي",
      "rest_image" : "assets/logo/spectt.jpg",},

  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      key: _keyDrawer,
      endDrawer: myDrawer(),
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(onPressed: (){}, icon:Icon(Icons.home, color: Colors.white,)),
            Text('الرئيسية',style: TextStyle(fontFamily: 'reg',fontWeight: FontWeight.bold),)
          ],

        ),
        backgroundColor: mainColor,
        leading: IconButton( onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          _keyDrawer.currentState?.openEndDrawer();
                        },
                          child: Icon(Icons.menu,size: 40, color: itemColor,)),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child:
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextFormField(
                              controller: sr,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white54,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:  textColorActive,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  suffixIcon:IconButton(
                                    icon:Icon(Icons.search),
                                    onPressed: (){

                                    },
                                  ),
                                  label: Text('بحث',style: TextStyle(fontSize: 16,color: textColorActive,fontFamily: 'reg'),)
                              ),
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child:ListView.builder(
                  itemCount: myArray_cat.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context , int index){
                    return
                    SingleCategory(
                        cat_id: myArray_cat[index]["cat_id"].toString(),
                        cat_image:myArray_cat[index]["cat_image"].toString(),
                        cat_name: myArray_cat[index]["cat_name"].toString());
                  }),
      ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child:ListView.builder(
                    itemCount: myArray_rest.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context , int index){
                      return
                        SingleRest(
                          rest_id: myArray_rest[index]["rest_id"].toString(),
                          rest_name:  myArray_rest[index]["rest_name"].toString(),
                          rest_dec: myArray_rest[index]["rest_dec"].toString(),
                          rest_image: myArray_rest[index]["rest_image"].toString(),);
                    }),
              ),

      ],
    ),
        ),
    ),


      ),
    );


  }
}

class SingleRest extends StatelessWidget {
  final String rest_id;
  final String rest_name;
  final String rest_dec;
  final String rest_image;
  SingleRest({required this.rest_id, required this.rest_name, required this.rest_dec, required this.rest_image});

  @override
  Widget build(BuildContext context) {
    return  Container(

      alignment: Alignment.bottomRight,
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Food(),));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.teal[50],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(rest_image),

                ),
              ),
            ),
          ),
          Text(rest_name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16, fontFamily: 'reg'),),
          Text(rest_dec, style: TextStyle(color: textColor , fontFamily: 'reg'),),
        ],
      ),
    );

  }
}




class SingleCategory extends StatelessWidget {
 final String cat_id;
 final String cat_name;
 final String cat_image;

 SingleCategory({required this.cat_id,required this.cat_name,required this.cat_image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      child:Column(children: [
        InkWell(
          onTap: (){


          },
          child: Container(
            height: 100,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.teal[50],
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(cat_image),
            ),
            ),),
        ),
         Text(cat_name, style:TextStyle(fontFamily: 'reg', fontWeight: FontWeight.bold),),
      ],
      ) ,
    );
  }
}

