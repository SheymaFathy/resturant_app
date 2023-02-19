import 'package:cloud_firestore/cloud_firestore.dart';

class ResturantModel {
  String? name;
  String? image;
  String? description;
  String? address;
  String? location;

  ResturantModel({this.image, this.name, this.address, this.description, this.location});

  factory ResturantModel.fromJson(DocumentSnapshot snapshot) {
    return ResturantModel(
        name: snapshot["name"],
        image: snapshot["image"],
        address: snapshot["address"],
        description: snapshot["description"],
        location:snapshot["lacation"],
    );
  }
}
