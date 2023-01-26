import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


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
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: AppBar(
        actions: [
          Row(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Google Map')
              ),
            ],
          )
        ],
        elevation: 0,
        backgroundColor: mainColor,
      ),
      body: GoogleMap(
        onTap: (location){
          print(location);
      setState(() {
        myMarkers.add(Marker(markerId: MarkerId('1'),
          position:LatLng(location.latitude, location.longitude),
          infoWindow: InfoWindow(
            title: 'R.M.S',
            snippet: 'Kindlly, Tel other about as',
            onTap: (){

            },
          ),
        ));
      });
        },
        initialCameraPosition:CameraPosition(
            target:LatLng(30.011912109198054, 31.20804801660021),
          zoom: 10,
        ) ,
      onMapCreated: (GoogleMapController googleMapController){
          setState(() {

          });
      },
      markers: myMarkers,
      ),
    ));
  }
}
