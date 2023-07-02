import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:track_mate_app/features/add_trip/widgets/location_picker_dialog.dart';

class AddTripProvider with ChangeNotifier {
  LatLng selectedLocation = const LatLng(0, 0);

  List<Polyline> polyLines = <Polyline>[];

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

  void refresh() {
    selectedDaerah = null;
    selectedLevel = null;
    polyLines.clear();
    titleController.clear();
    panjangTrackController.clear();
    ketinggianAwalController.clear();
    ketinggianAkhirController.clear();
    deskripsiController.clear();
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
