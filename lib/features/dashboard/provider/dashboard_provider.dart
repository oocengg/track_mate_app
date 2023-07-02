import 'package:flutter/material.dart';
import 'package:track_mate_app/features/home/view/home.dart';
import 'package:track_mate_app/features/trip/view/trip.dart';
import 'package:track_mate_app/features/profile/view/profile.dart';

class DashboardProvider with ChangeNotifier {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const Home(),
    const Trip(),
    const Profile(),
  ];

  void setSelectedIndex(BuildContext context, int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
