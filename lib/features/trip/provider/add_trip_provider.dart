import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:track_mate_app/features/trip/model/trip_model.dart';
import 'package:track_mate_app/features/trip/provider/detail_trip_provider.dart';
import 'package:track_mate_app/features/trip/view/widgets/location_picker_dialog.dart';

class AddTripProvider with ChangeNotifier {
  LatLng selectedLocation = const LatLng(0, 0);

  List<Polyline> polyLines = <Polyline>[];
  List<XFile> image = [];

  String? selectedDaerah;
  String? selectedLevel;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // TextEditingController latitudeAwalController = TextEditingController();
  // TextEditingController longitudeAwalController = TextEditingController();
  // TextEditingController latitudeAkhirController = TextEditingController();
  // TextEditingController longitudeAkhirController = TextEditingController();

  final TextEditingController titleController = TextEditingController();

  final TextEditingController panjangTrackController = TextEditingController();
  final TextEditingController ketinggianAwalController =
      TextEditingController();
  final TextEditingController ketinggianAkhirController =
      TextEditingController();

  final TextEditingController daerahController = TextEditingController();

  final TextEditingController levelController = TextEditingController();

  final TextEditingController deskripsiController = TextEditingController();

  Future<void> openLocationPickerDialog(BuildContext context) async {
    final List<Polyline>? selectedLocation = await showDialog<List<Polyline>>(
      context: context,
      builder: (BuildContext context) {
        return const LocationPickerDialog();
      },
    );

    if (selectedLocation != null) {
      polyLines.addAll(selectedLocation);
    }

    notifyListeners();
  }

  Future<void> addTrip(BuildContext context) async {
    TripModel newTrip = TripModel(
      title: titleController.text,
      panjangTrack: panjangTrackController.text,
      ketinggianAwal: ketinggianAwalController.text,
      ketinggianAkhir: ketinggianAkhirController.text,
      daerah: daerahController.text,
      level: levelController.text,
      deskripsi: deskripsiController.text,
      image: image,
      polylines: polyLines,
    );

    // Map<String, dynamic> tripMap = {
    //   'title': newTrip.title,
    //   'panjangTrack': newTrip.panjangTrack,
    //   'ketinggianAwal': newTrip.ketinggianAwal,
    //   'ketinggianAkhir': newTrip.ketinggianAkhir,
    //   'daerah': newTrip.daerah,
    //   'level': newTrip.level,
    //   'deskripsi': newTrip.deskripsi,
    //   'imagePaths': newTrip.imagePaths,
    //   'polylines': newTrip.polylines,
    // };

    // Provider.of<DetailTripProvider>(context, listen: false)
    //     .tripData
    //     .add(tripMap);

    // Provider.of<DetailTripProvider>(context, listen: false)
    //     .polyLines
    //     .addAll(polyLines);

    Provider.of<DetailTripProvider>(context, listen: false)
        .dataList
        .add(newTrip);

    Provider.of<DetailTripProvider>(context, listen: false).refresh();

    refresh();
  }

  void refresh() {
    selectedDaerah = null;
    selectedLevel = null;
    polyLines.clear();
    titleController.clear();
    panjangTrackController.clear();
    ketinggianAwalController.clear();
    ketinggianAkhirController.clear();
    deskripsiController.clear();
    // image.clear();
    notifyListeners();
  }

  String? validateInputValueAngka(String value) {
    if (value.isEmpty) {
      return 'Form tidak boleh kosong';
    }

    const numericRegex = r'^\d+$';
    if (!RegExp(numericRegex).hasMatch(value)) {
      return 'Harus Angka';
    }

    return null;
  }

  String? validateInputValue(String value) {
    if (value.isEmpty) {
      return 'Form tidak boleh kosong';
    }

    return null;
  }

  void addImage(XFile value) {
    image.add(value);
    notifyListeners();
  }

  void addListImage(List<XFile> value) {
    image.addAll(value);
    notifyListeners();
  }

  void removeImage(int index) {
    if (index >= 0 && index < image.length) {
      image.removeAt(index);
      notifyListeners();
    }
  }

  // Future<void> openEndLocationPickerDialog(BuildContext context) async {
  //   final LatLng? selectedLocation = await showDialog<LatLng>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return const LocationPickerDialog();
  //     },
  //   );

  //   if (selectedLocation != null) {
  //     this.selectedLocation = selectedLocation;
  //     latitudeAkhirController.text = selectedLocation.latitude.toString();
  //     longitudeAkhirController.text = selectedLocation.longitude.toString();
  //   }

  //   notifyListeners();
  // }
}
