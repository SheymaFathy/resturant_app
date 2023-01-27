import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class myLocation extends StatefulWidget {
  const myLocation({Key? key}) : super(key: key);

  @override
  State<myLocation> createState() => _myLocationState();
}

class _myLocationState extends State<myLocation> {
  Color mainColor = Color(0xff0a8791);
  Color textColorActive = Color(0xff0e122b);
  Color textColor = Color(0xffc2c2cb);
  Color itemColor = Color(0xfffba83c);
  var myMarkers = HashSet<Marker>();

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
          body: GoogleMap(
            onTap: (location) async {
              String _host = 'https://maps.google.com/maps/api/geocode/json';
              final url =
                  '$_host?key=AIzaSyDvab4Kkpwebwd5Ky_95Lr2LK2dAztdp6A&language=en&latlng=${location.latitude},${location.longitude}';
              if (location.latitude != null && location.longitude != null) {
                var response = await http.get(Uri.parse(url));
                if (response.statusCode == 200) {
                  print(response.body);
                  // Map data = jsonDecode(response.body);
                  // String _formattedAddress =
                  //     data["results"][0]["formatted_address"];
                  // print("response ==== $_formattedAddress");
                  // print(data);
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
        ));
  }
}
