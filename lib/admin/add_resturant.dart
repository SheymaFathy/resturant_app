import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resturants/models/category_model.dart';
import '../drawer/drawer.dart';
import '../main.dart';
import 'admin.dart';
import 'currentLocation.dart';

class AddResturant extends StatefulWidget {
   AddResturant({super.key,  this.lan,  this.lat});

   double? lat, lan;
  @override
  State<AddResturant> createState() => _AddResturantState();
}

class _AddResturantState extends State<AddResturant> {
  TextEditingController add1 = new TextEditingController();
  TextEditingController add2 = new TextEditingController();
  TextEditingController add3 = new TextEditingController();


   XFile? image;
  late XFile _image;
  ImagePicker picker = ImagePicker();

  uploadImg() async {
     image = await picker.pickImage(source: ImageSource.gallery);
  }

  uploadCamera() async {
   image = await picker.pickImage(source: ImageSource.camera);
    img = (_image.path);
  }

  final store = FirebaseFirestore.instance;
  late String img;

  Future<String> uploadImage(String imagePath, String code) async {
    final ref = FirebaseStorage.instance.ref().child("users_images/$code");
    final uploadTask = ref.putFile(File(imagePath));
    final imageUrl = (await (await uploadTask).ref.getDownloadURL()).toString();
    return imageUrl;
  }

  late final listOfCategory = <CategoryModel>[];

  Future<List<CategoryModel>> getCategory() async {
    final data = await store.collection("category").get();
    listOfCategory
        .addAll(data.docs.map((e) => CategoryModel.fromJson(e)).toList());
    print(listOfCategory.length);
    return listOfCategory;
  }

  String? key;
  bool? choose = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategory();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text("إضافة مطعم", style: TextStyle(fontFamily: 'reg')),
          centerTitle: true,
        ),
        drawer: myDrawer(),
        body: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  listOfCategory.isEmpty
                      ? Center(child: CircularProgressIndicator())
                      : DropdownButton<CategoryModel>(
                    value: listOfCategory[0],
                    onChanged: (newValue) {
                      print(newValue!.name);
                      key = newValue.key;
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem<CategoryModel>(
                        child: Text(category.name!),
                        value: category,
                      );
                    }).toList(),
                  ),

                  const SizedBox(
                    height: 50,
                  ),

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  TextField(
                    controller: add1,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text('إسم المطعم',
                          style: TextStyle(fontFamily: 'reg')),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: add2,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text(
                        'الوصف',
                        style: TextStyle(fontFamily: 'reg'),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: add3,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label:
                      Text('العنوان', style: TextStyle(fontFamily: 'reg')),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
                      Expanded(
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              // MaterialPageRoute(
                              //     builder: (context) => DistanceCalculator(currentPosition: currentPosition, destination: destination,)));
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => myLocation()));
                            },
                            child: Container(
                              margin: EdgeInsets.all(5.0),
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 80.0,
                                    color: itemColor,
                                  ),
                                  Text(
                                    "الموقع",
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
                    height: 60,
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

                          await store.collection("category")
                              .doc(key)
                              .collection("resturants")
                              .add({
                          "name": add1.text,
                          "discription": add2.text,
                          "address": add3.text,
                          "image":await uploadImage(image!.path, "123456"),
                            "location":widget.lat
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AdminPanal()));
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
