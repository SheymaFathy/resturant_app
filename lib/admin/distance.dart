import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class DistanceCalculator extends StatelessWidget {
  Position? currentPosition;
  Position? destination;

  DistanceCalculator({required this.currentPosition, required this.destination});

  @override
  Widget build(BuildContext context) {
    double distanceInMeters = calculateDistance(currentPosition!, destination!);
    String distance = '${distanceInMeters.toStringAsFixed(2)} meters';

    return Text(distance);
  }

  double calculateDistance(Position current, Position destination) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((destination.latitude - current.latitude) * p) / 2 +
        c(current.latitude * p) * c(destination.latitude * p) *
            (1 - c((destination.longitude - current.longitude) * p)) / 2;

    return 12742 * asin(sqrt(a));
  }
}
