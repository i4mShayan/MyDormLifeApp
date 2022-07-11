import 'package:flutter/material.dart';
import 'package:my_dorm_life/screens/navigation_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/navigation_page',
      routes: {
        // '/': (context) => //splash,
        '/navigation_page': (context) => NavigationPage(),
      },
    ),
  );
}