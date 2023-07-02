import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:track_mate_app/features/add_trip/provider/add_trip_provider.dart';
import 'package:track_mate_app/features/dashboard/provider/dashboard_provider.dart';
import 'package:track_mate_app/features/dashboard/view/dashboard.dart';
import 'package:track_mate_app/features/detail_trip/provider/trip_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TripProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddTripProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trackmate',
        home: const Dashboard(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: Colors.black,
          ),
          primarySwatch: Colors.green,
          appBarTheme: const AppBarTheme(
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.green,
            ),
            elevation: 0,
          ),
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Colors.green,
            selectionColor: Colors.green,
            selectionHandleColor: Colors.green,
          ),
          inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.green,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            filled: true, // Mengaktifkan fill
            fillColor: Colors.green
                .withOpacity(0.12), // Memberikan warna abu pada fill
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          dividerTheme: DividerThemeData(
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
