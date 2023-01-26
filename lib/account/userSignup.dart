import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/account/userSignin.dart';
import 'package:resturants/user/homePage.dart';


import '../main.dart';

class userSignUp extends StatefulWidget {

  @override
  State<userSignUp> createState() => _userSignUpState();
}

class _userSignUpState extends State<userSignUp> {

  bool pass=true;
  TextEditingController s1 =new TextEditingController();
  TextEditingController s2 =new TextEditingController();
  TextEditingController s3 =new TextEditingController();
  Icon ic = Icon(Icons.visibility_off, color: Colors.green[900],);

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();
  Future signUp()async{
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: s2.text.trim(), password: s3.text.trim());
  }
  void openHomePage(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      body:ListView(
        children:[
          Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: Text(' مشترك جديد',
                style: TextStyle(fontSize: 25,color:textColorActive,fontFamily: 'reg'),),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text('أنشئ حساب الآن',
              style: TextStyle(fontSize:20,color: itemColor,fontFamily: 'reg',fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text('ادخل بياناتك للاشتراك',
              style: TextStyle(fontSize:16,color: textColorActive,fontFamily: 'reg',),),
          ),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => userSignIn(),));

          }, child: Text('لديك حساب بالفعل؟',style: TextStyle(fontSize:16,color: mainColor,fontFamily: 'reg',),)),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Form(
              key:formstate ,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: s1,
                        keyboardType: TextInputType.text,
                        onChanged: (String value){
                          print(value);
                        },
                        validator : (text){
                          if (text!.isEmpty){
                            return 'Please fill username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54.withOpacity(0.80),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                  color:textColorActive,
                                  width: 0.5,
                                )
                            ),
                            suffixIcon: Icon(Icons.person, color:mainColor,),
                            label: Text('اسم المستخدم',
                              style: TextStyle(
                                  fontSize: 16,
                                  color:textColorActive,
                                  fontFamily: 'reg'),)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: s2,
                        keyboardType: TextInputType.emailAddress,
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
                                borderSide: BorderSide(
                                  color: textColorActive,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            suffixIcon: Icon(Icons.email, color:mainColor,),
                            label: Text('البريد الاليكتروني ',style: TextStyle(fontSize: 16,color:textColorActive,fontFamily: 'reg'),)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextFormField(
                        controller: s3,
                        keyboardType: TextInputType.text,
                        obscureText: pass,
                        onChanged: (String value){
                          print(value);
                        },
                        validator : (text){
                          if (text!.isEmpty){
                            return 'Password is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white54.withOpacity(0.80),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(7)
                            ),
                            suffixIcon:IconButton(
                              icon:ic,
                              onPressed: (){
                                setState((){
                                  pass=!pass;
                                  if(pass==false){
                                    ic = Icon(Icons.remove_red_eye_sharp,color:mainColor,);
                                  }
                                  else{
                                   ic = Icon(Icons.visibility_off, color:mainColor,);
                                  }
                                });

                              },
                            ),
                            label: Text('كلمة المرور',style: TextStyle(fontSize: 16,color: textColorActive,fontFamily: 'reg'),)
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10)

                      ),
                      child: MaterialButton(
                          child: Text('اشترك الآن',
                            style: TextStyle(
                              fontFamily: 'reg',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),),
                        onPressed:() async {
                          var formdata = formstate.currentState;
                          if (formdata!.validate()) {
                            try{
                              var user =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: s2.text, password: s3.text);
                              if(user!=null){
                                print("erroooooooooooor");
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }catch (e){
                              print(e);
                            }


                          } else {
                            print("not valid");
                          }
                        },
                      ),
                    ),

                    SizedBox(height: 10,),
                    Center(child: TextButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Text(" دخول كزائر",
                        style: TextStyle(
                            color:textColorActive,
                            fontSize: 16,
                            fontFamily: 'reg',
                            fontWeight: FontWeight.bold
                        ),),
                    )),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )
    );

  }
}

