import 'package:cloud_firestore/cloud_firestore.dart';

class MealModle {
  String? name;
  String? image;
  String? price;


  MealModle({this.image, this.name, this.price});

  factory MealModle.fromJson(DocumentSnapshot snapshot) {
    return MealModle(
        name: snapshot["name"],
        image: snapshot["image"],
        price: snapshot["price"]);

  }
}
