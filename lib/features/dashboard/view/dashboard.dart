import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:track_mate_app/features/dashboard/provider/dashboard_provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: provider.pages[provider.selectedIndex],
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white,
            indicatorColor: Colors.green.shade100,
            onDestinationSelected: (int index) {
              provider.setSelectedIndex(context, index);
            },
            selectedIndex: provider.selectedIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.green,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.explore,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.explore_outlined,
                  color: Colors.green,
                ),
                label: 'Trip',
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                icon: Icon(
                  Icons.person_outlined,
                  color: Colors.green,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
