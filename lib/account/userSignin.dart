import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturants/user/homePage.dart';
import 'package:resturants/account/userSignup.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../admin/admin.dart';
import '../main.dart';

class userSignIn extends StatefulWidget {
  userSignIn({Key? key}) : super(key: key);

  @override
  State<userSignIn> createState() => _userSignInState();
}

class _userSignInState extends State<userSignIn> {
  bool pass = true;
  Icon passIcon = Icon(
    Icons.visibility_off,
    color: mainColor,
  );
  TextEditingController n1 = new TextEditingController();
  TextEditingController n2 = new TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(
                  'تسجيل دخول',
                  style: TextStyle(
                      fontSize: 25,
                      color: itemColor,
                      fontFamily: 'reg',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 7.0,
              ),
              child: Form(
                key: formstate,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
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
                          controller: n1,
                          onChanged: (String value) {
                            print(value);
                          },
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Email is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[150],
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  )),
                              suffixIcon: Icon(Icons.email, color: mainColor),
                              label: Text(
                                'البريد الاليكتروني ',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColorActive,
                                    fontFamily: 'reg'),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          controller: n2,
                          obscureText: pass,
                          validator: (text) {
                            if (text!.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[150],
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(20)),
                              suffixIcon: IconButton(
                                icon: passIcon,
                                onPressed: () {
                                  setState(() {
                                    pass = !pass;
                                    if (pass == false) {
                                      passIcon = Icon(
                                          Icons.remove_red_eye_sharp,
                                          color: mainColor);
                                    } else {
                                      passIcon = Icon(Icons.visibility_off,
                                          color: mainColor);
                                    }
                                  });
                                },
                              ),
                              label: Text(
                                'كلمة المرور',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: textColorActive,
                                    fontFamily: 'reg'),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: MaterialButton(
                            child: Text(
                              ' تأكيد',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontFamily: 'reg'),
                            ),
                            onPressed: () async {
                              var formdata = formstate.currentState;
                              if (formdata!.validate()) {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: n1.text, password: n2.text);
                                print(FirebaseAuth.instance.currentUser);
                                if (FirebaseAuth.instance.currentUser!.uid !=
                                    null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage(),
                                      ));
                                }
                              }
                              // var formdata = formstate.currentState;
                              // if (formdata!.validate()) {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => HomePage(),
                              //       ));
                              // } else {
                              //   print("not valid");
                              // }
                            }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Row(
                        children: [
                          Text(
                            "لا تمتلك حساب ؟",
                            style: TextStyle(
                                color: textColorActive,
                                fontSize: 15,
                                fontFamily: 'reg'),
                          ),
                          // SizedBox(width: 5,),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => userSignUp(),
                                  ));
                            },
                            child: Text('اشترك الآن',
                                style: TextStyle(
                                    color: itemColor,
                                    fontSize: 15,
                                    fontFamily: 'reg')),
                          )
                        ],
                      )),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text(
                            'تخطي تسجيل الدخول  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'reg',
                                fontSize: 17,
                                color: textColorActive),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminPanal()));
                          },
                          child: Text(
                            'أو   ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'reg',
                                fontSize: 20,
                                color: textColorActive),
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdminPanal()));
                          },
                          child: Text(
                            'الدخول للوحة التحكم  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'reg',
                                fontSize: 17,
                                color: textColorActive),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
