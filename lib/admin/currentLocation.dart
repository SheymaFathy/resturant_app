import 'dart:collection';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:resturants/admin/add_resturant.dart';


import '../main.dart';
import 'admin.dart';

class myLocation extends StatefulWidget {
  const myLocation({Key? key}) : super(key: key);

  @override
  State<myLocation> createState() => _myLocationState();
}

class _myLocationState extends State<myLocation> {

  var myMarkers = HashSet<Marker>();
  late double lat, lan;


  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Google Map')),
                ],
              )
            ],
            elevation: 0,
            backgroundColor: mainColor,
          ),
          body: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                child: GoogleMap(
                  onTap: (location) async {
                    String _host = 'https://maps.google.com/maps/api/geocode/json';
                    final url =
                        '$_host?key=AIzaSyDvab4Kkpwebwd5Ky_95Lr2LK2dAztdp6A&language=en&latlng=${location.latitude},${location.longitude}';
                    if (location.latitude != null && location.longitude != null) {
                      var response = await http.get(Uri.parse(url));
                      if (response.statusCode == 200) {
                        print(response.body);
                      } else
                        return null;
                    }
                    print(location);
                    setState(() {
                      myMarkers.add(Marker(
                        markerId: MarkerId('1'),
                        position: LatLng(location.latitude, location.longitude),
                        infoWindow: InfoWindow(
                          title: 'R.M.S',
                          snippet: 'Kindlly, Tel other about as',
                          onTap: () {},
                        ),
                      ));

                    });
                    lat = location.latitude;
                    lan= location.longitude;
                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(30.011912109198054, 31.20804801660021),
                    zoom: 10,
                  ),
                  onMapCreated: (GoogleMapController googleMapController) {},
                  onCameraMove: (camera) async {
                    print(camera.target.latitude);
                    print(camera.target.longitude);
                  },
                  markers: myMarkers,
                ),
              ),
              MaterialButton(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text('تأكيــــــــــد',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'reg',
                        color: mainColor
                    ),),
                  ),
                  onPressed: ()async {
                    // Get a reference to the Firestore database
//                     final db = FirebaseFirestore.instance;
//
// // Function to store the current location of the user
//                     storeLocation(double latitude, double longitude) async {
//                       DocumentReference userRef = db.collection("users").doc("Jlcggm124JtaOQ0pnMyW");
//
//                       await userRef.update({
//                         "locations": FieldValue.arrayUnion([
//                           {
//                             "latitude": latitude,
//                             "longitude": longitude,
//                             "timestamp": Timestamp.now(),
//                           },
//                         ])
//                       });
//                     }

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddResturant(lan: lan, lat: lat, )));




                  }),
            ],
          ),
        ));
  }
}
