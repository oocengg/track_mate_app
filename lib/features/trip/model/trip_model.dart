import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';

class TripModel {
  String title;
  String panjangTrack;
  String ketinggianAwal;
  String ketinggianAkhir;
  String daerah;
  String level;
  String deskripsi;
  List<XFile> image;
  List<Polyline> polylines;

  TripModel({
    required this.title,
    required this.panjangTrack,
    required this.ketinggianAwal,
    required this.ketinggianAkhir,
    required this.daerah,
    required this.level,
    required this.deskripsi,
    required this.image,
    required this.polylines,
  });
}
