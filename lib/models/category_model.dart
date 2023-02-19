import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? name;
  String? image;
  String? key;

  CategoryModel({this.image, this.name, this.key});

  factory CategoryModel.fromJson(DocumentSnapshot snapshot) {
    return CategoryModel(
        image: snapshot["image"], name: snapshot["name"], key: snapshot.id);
  }
}
