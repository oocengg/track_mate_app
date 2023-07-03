// import 'dart:convert';
// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:track_mate_app/features/trip/model/trip_model.dart';

class DetailTripProvider with ChangeNotifier {
  final start = TextEditingController();
  final end = TextEditingController();
  bool isVisible = false;
  List<LatLng> routpoints = [const LatLng(52.05884, -1.345583)];

  List<Map<String, dynamic>> tripData = [];

  List<Polyline> polyLines = <Polyline>[];

  List<TripModel> dataList = [];

  void refresh() {
    notifyListeners();
  }

  // void setMap() async {
  //   var v1 = -1.8488218;
  //   var v2 = 101.350872;
  //   var v3 = -1.9495684;
  //   var v4 = 101.1744694;

  //   var url = Uri.parse(
  //       'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
  //   var response = await http.get(url);
  //   routpoints = [];
  //   var ruter =
  //       jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];
  //   for (int i = 0; i < ruter.length; i++) {
  //     var reep = ruter[i].toString();
  //     reep = reep.replaceAll("[", "");
  //     reep = reep.replaceAll("]", "");
  //     var lat1 = reep.split(',');
  //     var long1 = reep.split(",");
  //     routpoints.add(
  //       LatLng(
  //         double.parse(lat1[1]),
  //         double.parse(
  //           long1[0],
  //         ),
  //       ),
  //     );
  //   }
  // }
}
