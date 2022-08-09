import 'package:flutter/material.dart';
import 'package:my_dorm_life/screens/navigation_page.dart';
import 'package:my_dorm_life/theme_provider.dart';
import 'package:my_dorm_life/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => AppThemeProvider(),
        builder: (context, _){
          final provider = Provider.of<AppThemeProvider>(context);
          return MaterialApp(
            themeMode: provider.themeMode,
            theme: Themes.lightTheme,
            darkTheme: Themes.darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: '/navigation_page',
            routes: {
              // '/': (context) => //splash,
              '/navigation_page': (context) => NavigationPage(),
            },
          );
        },
      ),
  );
}