import 'package:flutter/material.dart';

// PAGES
import 'package:google_maps_api/maps_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: "/maps",
      routes: {
        "/maps": (context) => const MapsPage(),
      },
    );
  }
}
