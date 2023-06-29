import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:track_mate_app/features/home/view/home.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trackmate',
      home: const Home(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Colors.black,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.green,
          ),
          shape: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
        dividerTheme: DividerThemeData(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
