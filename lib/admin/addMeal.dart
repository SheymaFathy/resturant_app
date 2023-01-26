
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'admin.dart';
class AddMeal extends StatefulWidget {
  const AddMeal({super.key});

  @override
  State<AddMeal> createState() => _AddMealState();
}

class _AddMealState extends State<AddMeal> {
  Color mainColor = Color(0xff0a8791);
  Color textColorActive = Color(0xff0e122b);
  Color textColor = Color(0xffc2c2cb);
  Color itemColor = Color(0xfffba83c);
  TextEditingController add1 = new TextEditingController();
  TextEditingController add2 = new TextEditingController();
  TextEditingController add3 = new TextEditingController();


  late XFile image;
  late XFile _image;
  ImagePicker picker = ImagePicker();

  uploadImg() async {
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
  }

  uploadCamera() async {
    XFile? _image = await picker.pickImage(source: ImageSource.camera);
    img = (_image!.path);
  }
  final store = FirebaseFirestore.instance;
  late String img;

  Future<String> uploadImage(String imagePath, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text("إضافة وجبة رئيسية", style: TextStyle(fontFamily: 'reg')),
        centerTitle: true,
      ),

      body: ListView(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: add1,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    label: Text('إسم الوجبة', style: TextStyle(fontFamily: 'reg')),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: add2,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    label: Text('السعر', style: TextStyle(fontFamily: 'reg'),),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: add3,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration
                    (
                    label: Text('الوصف', style: TextStyle(fontFamily: 'reg')),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),

                  ),
                ),
                SizedBox(height: 10,),

                SizedBox(height: 10,),
                Text('اضف صورة',style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'reg',
                    color: textColorActive
                ),),


                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: GestureDetector(
                          onTap:uploadImg,
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.photo_camera_back,
                                  size: 80.0,
                                  color: itemColor,
                                ),
                                Text(
                                  "الاستوديو",
                                  style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                                )
                              ],
                            ),
                          ),
                        )),
                    Expanded(
                        child: GestureDetector(
                          onTap:uploadCamera,
                          child: Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  size: 80.0,
                                  color: itemColor,
                                ),
                                Text(
                                  "الكاميرا",
                                  style: TextStyle(fontSize: 15.0,fontFamily: 'reg'),
                                )
                              ],
                            ),
                          ),
                        )),

                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  height: 60,
                  decoration:BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(17)
                  ),
                  child: MaterialButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text('تأكيــــــــــد',style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'reg',
                            color: Colors.white
                        ),),
                      ),
                      onPressed: ()async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AdminPanal()));
                        await store.collection("meal").add({"name":add1.text,"price":add3.text,"description":add2.text});
                        uploadImg();


                      }),



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
