import 'package:flutter/material.dart';
import 'package:track_mate_app/features/home/view/pages/home.dart';
import 'package:track_mate_app/features/trip/view/pages/trip.dart';
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
