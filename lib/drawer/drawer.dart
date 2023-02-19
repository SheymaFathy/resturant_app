import 'package:flutter/material.dart';
import 'package:resturants/main.dart';
import 'package:resturants/user/food.dart';

import '../user/homePage.dart';
import '../user/userLocation.dart';
class myDrawer extends StatefulWidget {


  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Directionality(textDirection: TextDirection.rtl, child: Scaffold(
        body: Container(
          child: Drawer(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                children: [

                  UserAccountsDrawerHeader(
                    accountName: Column(
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          "فريدة",
                          style: TextStyle(color:textColorActive, fontSize: 15.0, fontFamily: 'reg'),
                        ),
                      ],
                    ),
                    accountEmail: Text(
                      "freelance.ss22@gmail.com",
                      style: TextStyle(color:textColor, fontSize: 15.0, fontFamily: 'reg'),
                    ),
                    currentAccountPicture: GestureDetector(
                      child: new CircleAvatar(
                        backgroundColor: mainColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(color: Colors.grey[100]),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {   Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
                          child: ListTile(
                            title: Text(
                              "الصفحة الرئيسية",
                              style: TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                            ),
                            leading: Icon(
                              Icons.home,
                              color: itemColor,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 18.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children: <Widget>[

                      ],
                    ),
                  ),
                  ExpansionTile(
                    title: Text(
                      "حسابي",
                      style: TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                    ),
                    children: <Widget>[
//======================child account
                      Container(
                        padding: EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {

                              },
                              child: ListTile(
                                title: Text(
                                  "تغيير الاعدادات الشخصية",
                                  style: TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                                ),
                                leading: Icon(
                                  Icons.settings,
                                  color: itemColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 18.0,
                                ),
                              ),
                            ),
                            Divider(
                              color: Colors.grey[500],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10.0, left: 10.0),
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              onTap: () {


                              },
                              child: ListTile(
                                title: Text(
                                  "تغيير كلمة المرور",
                                  style: TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                                ),
                                leading: Icon(
                                  Icons.lock_open,
                                  color: itemColor,
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //======================end child account
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Divider(
                      color: Colors.grey[500],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children:[
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                          },
                          child: ListTile(
                            title: Text(
                              "قائمة المطاعم",
                              style: TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                            ),
                            leading: Icon(
                              Icons.restaurant,
                              color:itemColor,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 18.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Food()));
                          },
                          child: ListTile(
                            title: Text(
                              "قائمة المأكولات",
                              style:TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                            ),
                            leading: Icon(
                              Icons.menu_book,
                              color: itemColor,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 18.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {

                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> GetLocation(x: ,y: ,)));
                          },
                          child: ListTile(
                            title: Text(
                              "خروج",
                              style: TextStyle(color:textColorActive, fontSize: 17.0, fontFamily: 'reg'),
                            ),
                            leading: Icon(
                              Icons.drive_eta,
                              color: itemColor,
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 18.0,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
    ));
  }
}
