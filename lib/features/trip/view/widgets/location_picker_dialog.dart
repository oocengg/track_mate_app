import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_dragmarker/flutter_map_dragmarker.dart';
import 'package:flutter_map_line_editor/flutter_map_line_editor.dart';
import 'package:latlong2/latlong.dart';

class LocationPickerDialog extends StatefulWidget {
  const LocationPickerDialog({super.key});

  @override
  LocationPickerDialogState createState() => LocationPickerDialogState();
}

class LocationPickerDialogState extends State<LocationPickerDialog> {
  late PolyEditor polyEditor;

  final polyLines = <Polyline>[];

  final testPolyline = Polyline(color: Colors.blue, strokeWidth: 3, points: []);

  LatLng selectedLocation = const LatLng(-7.983908, 112.621391);

  @override
  void initState() {
    polyEditor = PolyEditor(
      addClosePathMarker: false,
      points: testPolyline.points,
      pointIcon: const Icon(Icons.location_on, size: 23, color: Colors.red),
      intermediateIcon: const Icon(Icons.lens, size: 10, color: Colors.grey),
      callbackRefresh: () {
        debugPrint(testPolyline.toString());
        debugPrint("polyedit setstate");
        setState(() {});
      },
    );
    polyLines.add(testPolyline);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Pilih Titik Awal',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      content: Container(
        width: double.maxFinite,
        height: 300.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child:
            // FlutterMap(
            //   options: MapOptions(
            //     center: selectedLocation,
            //     zoom: 10.0,
            //   ),
            //   children: [
            //     TileLayer(
            //       urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            //       userAgentPackageName: 'com.example.app',
            //     ),
            //     MarkerLayer(
            //       markers: [
            //         Marker(
            //           point: selectedLocation,
            //           builder: (ctx) => const Icon(
            //             Icons.location_on,
            //             size: 50.0,
            //             color: Colors.red,
            //           ),
            //         ),
            //       ],
            //     )
            //   ],
            // ),

            FlutterMap(
          options: MapOptions(
            onTap: (_, ll) {
              polyEditor.add(testPolyline.points, ll);
            },
            center: const LatLng(45.5231, -122.6765),
            zoom: 10,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            ),
            PolylineLayer(polylines: polyLines),
            DragMarkers(markers: polyEditor.edit()),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            testPolyline.points.clear();
          },
          child: const Text('Ulangi'),
        ),
        TextButton(
          onPressed: () {
            polyLines.clear();
            testPolyline.points.clear();
            Navigator.of(context).pop();
          },
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(polyLines);
          },
          child: const Text('Simpan'),
        ),
      ],
    );
  }
}
