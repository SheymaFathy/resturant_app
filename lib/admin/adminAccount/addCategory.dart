import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturants/main.dart';


class addCategory extends StatefulWidget {
  const addCategory({Key? key}) : super(key: key);

  @override
  State<addCategory> createState() => _addCategoryState();
}

TextEditingController addCat1 = new TextEditingController();

final store = FirebaseFirestore.instance;
late String img;

Future<String> uploadImage(String imagePath, String code) async {
  final ref = FirebaseStorage.instance.ref().child("users_images/$code");
  final uploadTask = ref.putFile(File(imagePath));
  final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
  return imageUrl;
}

class _addCategoryState extends State<addCategory> {
  final store = FirebaseFirestore.instance;
  XFile? image;

  ImagePicker picker = ImagePicker();

  uploadImg() async {
    image = await picker.pickImage(source: ImageSource.gallery);
  }

  uploadCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    img = (image!.path);
  }





  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text("إضافة تصنيف", style: TextStyle(fontFamily: 'reg')),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    child: TextField(
                      controller: addCat1,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        label: Text('إسم التصنيف',
                            style: TextStyle(fontFamily: 'reg')),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'اضف صورة',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'reg',
                        color: textColorActive),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                          child: GestureDetector(
                        onTap: uploadImg,
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
                                style: TextStyle(
                                    fontSize: 15.0, fontFamily: 'reg'),
                              )
                            ],
                          ),
                        ),
                      )),
                      Expanded(
                          child: GestureDetector(
                        onTap: uploadCamera,
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
                                style: TextStyle(
                                    fontSize: 15.0, fontFamily: 'reg'),
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(17)),
                    child: MaterialButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            'تأكيــــــــــد',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'reg',
                                color: Colors.white),
                          ),
                        ),
                        onPressed: () async {
                          final data = await store.collection("category").add({
                            "name": addCat1.text,
                            "image":await uploadImage(image!.path, "124356")
                          });

                            Navigator.pop(context);
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
