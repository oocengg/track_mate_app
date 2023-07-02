import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:track_mate_app/features/add_trip/view/add_trip.dart';
import 'package:track_mate_app/features/trip/view/widgets/journey_bar.dart';

class Trip extends StatefulWidget {
  const Trip({super.key});

  @override
  State<Trip> createState() => _TripState();
}

class _TripState extends State<Trip> {
  String? selectedRegion;
  String? selectedLevel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const AddTrip(),
            ),
          );
        },
        tooltip: 'Tambah',
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Your Trip',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Daerah',
                      ),
                      value: selectedRegion,
                      items: const [
                        DropdownMenuItem(
                          value: 'Jakarta',
                          child: Text('Jakarta'),
                        ),
                        DropdownMenuItem(
                          value: 'Bandung',
                          child: Text('Bandung'),
                        ),
                        // Tambahkan item dropdown lainnya sesuai dengan daerah di Indonesia yang Anda inginkan
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedRegion = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10), // Jarak antara dua dropdown
                  Expanded(
                    flex: 1,
                    child: DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Level',
                      ),
                      value: selectedLevel,
                      items: const [
                        DropdownMenuItem(
                          value: 'Beginner',
                          child: Text('Beginner'),
                        ),
                        DropdownMenuItem(
                          value: 'Intermediate',
                          child: Text('Intermediate'),
                        ),
                        // Tambahkan item dropdown lainnya sesuai dengan level yang Anda inginkan
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedLevel = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text(
                'Your Trip',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 10),
              const JourneyBar(
                  title: 'Gunung Merbabu',
                  desc:
                      'LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem'),
              const JourneyBar(
                  title: 'Gunung Merbabu',
                  desc:
                      'LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem'),
              const JourneyBar(
                  title: 'Gunung Merbabu',
                  desc:
                      'LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem'),
              const JourneyBar(
                  title: 'Gunung Merbabu',
                  desc:
                      'LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem'),
              const JourneyBar(
                  title: 'Gunung Merbabu',
                  desc:
                      'LoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLoremLorem'),
              // Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         ElevatedButton(
              //             style: ElevatedButton.styleFrom(
              //                 backgroundColor: Colors.grey[500]),
              //             onPressed: () async {
              //               // List<Location> start_l =
              //               //     await locationFromAddress(start.text);
              //               // List<Location> end_l =
              //               //     await locationFromAddress(end.text);
              //               var v1 = -7.925258;
              //               var v2 = 112.6376775;
              //               var v3 = -7.9471674;
              //               var v4 = 112.6168166;

              //               var url = Uri.parse(
              //                   'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
              //               var response = await http.get(url);
              //               setState(() {
              //                 routpoints = [];
              //                 var ruter = jsonDecode(response.body)['routes'][0]
              //                     ['geometry']['coordinates'];
              //                 for (int i = 0; i < ruter.length; i++) {
              //                   var reep = ruter[i].toString();
              //                   reep = reep.replaceAll("[", "");
              //                   reep = reep.replaceAll("]", "");
              //                   var lat1 = reep.split(',');
              //                   var long1 = reep.split(",");
              //                   routpoints.add(LatLng(double.parse(lat1[1]),
              //                       double.parse(long1[0])));
              //                 }
              //                 isVisible = !isVisible;
              //               });
              //             },
              //             child: const Text('Press')),
              //         const SizedBox(
              //           height: 10,
              //         ),
              //         Container(
              //           height: 500,
              //           width: 400,
              //           color: Colors.green,
              //           child: Visibility(
              //             visible: isVisible,
              //             child: FlutterMap(
              //               options: MapOptions(
              //                 center: routpoints[0],
              //                 zoom: 10,
              //               ),
              //               // nonRotatedChildren: [
              //               //   AttributionWidget.defaultWidget(
              //               //       source: 'OpenStreetMap contributors',
              //               //       onSourceTapped: null),
              //               // ],
              //               children: [
              //                 TileLayer(
              //                   urlTemplate:
              //                       'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              //                   userAgentPackageName: 'com.example.app',
              //                 ),
              //                 PolylineLayer(
              //                   polylineCulling: false,
              //                   polylines: [
              //                     Polyline(
              //                         points: routpoints,
              //                         color: Colors.blue,
              //                         strokeWidth: 9)
              //                   ],
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
