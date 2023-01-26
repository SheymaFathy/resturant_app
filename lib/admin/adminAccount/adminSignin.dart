
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/admin/adminAccount/adminSignup.dart';

import '../../main.dart';
import '../admin.dart';


class adminSignIn extends StatefulWidget {
  adminSignIn({Key? key}) : super(key: key);

  @override
  State<adminSignIn> createState() => _adminSignInInState();
}

class _adminSignInInState extends State<adminSignIn> {

  bool pass=true;
  Icon ic = Icon(Icons.visibility_off, color:Color(0xff0a8791),);
  TextEditingController n1 =new TextEditingController();
  TextEditingController n2 =new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child:Scaffold(
      body:ListView(
        scrollDirection: Axis.vertical,
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              Center(
                child: Text('سجل دخول الى حسابك ',
                  style:
                  TextStyle(fontSize:20,color: itemColor,fontFamily: 'reg',fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 20,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0 ,),
                child: Form(
                  key: formstate ,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: n1,
                          onChanged: (String value){
                            print(value);
                          },
                          validator : (text){
                            if (text!.isEmpty){
                              return 'Email is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white54.withOpacity(0.80),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: textColorActive,
                                    width: 0.5,
                                  )
                              ),
                              suffixIcon: Icon(Icons.email, color:mainColor),
                              label: Text('البريد الاليكتروني ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColorActive,
                                    fontFamily: 'reg'),)
                          ),
                        ),
                        SizedBox(height: 20,),
                        TextFormField(
                          controller: n2,
                          obscureText: pass,

                          validator : (text){
                            if (text!.isEmpty){
                              return 'Password is required';
                            }
                            return null;
                          },
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
                                icon:ic,
                                onPressed: (){
                                  setState((){
                                    pass=!pass;
                                    if(pass==false){
                                      ic = Icon(Icons.remove_red_eye_sharp,color:mainColor);
                                    }
                                    else{
                                      ic = Icon(Icons.visibility_off, color:mainColor);
                                    }
                                  });

                                },
                              ),
                              label: Text('كلمة المرور',style: TextStyle(fontSize: 16,color: textColorActive,fontFamily: 'reg'),)
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: mainColor,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: MaterialButton(
                              child: Text(' دخول',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontFamily: 'reg'),),
                              onPressed:() async {
                                var formdata = formstate.currentState;
                                if (formdata!.validate()) {;
                                var adminAccount = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: n1.text,
                                    password: n2.text);
                                if(adminAccount != null){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPanal()));
                                }

                                }
                              }
                          ),
                        ),

                        Row(
                          children: [
                            Text('لا تملك صلاحية الدخول؟', style: TextStyle(fontFamily: 'reg', fontSize: 12, ),),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>adminSignUp()));
                            }, child: Text('إنشاء حساب جديد',style: TextStyle(fontFamily: 'reg', fontSize: 15, ),)),
                          ],
                        ),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPanal()));
                        }, child: Center(child: Text(' تخطي',style: TextStyle(fontFamily: 'reg', fontSize: 17,fontWeight: FontWeight.bold, color: mainColor ),))),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    ),
    );

  }
}
