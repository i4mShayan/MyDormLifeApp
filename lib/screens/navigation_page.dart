import 'dart:math';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:my_dorm_life/items/FAB_add_menu.dart';
import 'package:my_dorm_life/screens/settings_page.dart';
import 'package:my_dorm_life/screens/spends_page.dart';
import 'package:my_dorm_life/screens/test_screen.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  final List<Map<String, dynamic>> _buttons=[
    {
      'icon' : Icons.home_filled,
      'text' : 'Home',
      'screen' : TestScreen(),
    },
    {
      'icon' : Icons.attach_money_sharp,
      'text' : 'Spends',
      'screen' : SpendsPage(),
    },
    {
      'icon' : Icons.today_sharp,
      'text' : 'Plans',
      'screen' : TestScreen(),
    },
    {
      'icon' : Icons.settings_sharp,
      'text' : 'Settings',
      'screen' : SettingsPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppThemeProvider>(context);
    return DefaultTabController(
      length: _buttons.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                foregroundColor: Colors.white,
                title: Text('My Dorm Life',),
                leading: Icon(Icons.bed_rounded, size: 30,),
                actions: [
                  ThemeSwitcher(
                    clipper: const ThemeSwitcherCircleClipper(),
                    builder: (context) => IconButton(
                        onPressed: (){
                            provider.toggleTheme(!provider.isDarkMode);
                        },
                        icon: AnimatedSwitcher(
                          duration: Duration(milliseconds: 1000),
                          child: provider.isDarkMode ? Transform.rotate(angle: 3*pi/2 ,child: Icon(Icons.dark_mode_rounded,)) : Icon(Icons.light_mode_rounded, color: Colors.white,),
                        ),
                    ),
                  ),
                  SizedBox(width: 5,),
                ],
                titleSpacing: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: provider.isDarkMode ? Colors.black:Colors.blue,
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: provider.isDarkMode ? Colors.black:Colors.blue,
                forceElevated: true,
                // elevation: 2,
                floating: true,
                pinned: true,
                snap: true,
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: _buttons.map(
                          (button) =>
                          Tab(
                            icon: Icon(
                              button['icon'],
                            ),
                            text: innerBoxIsScrolled ? null:button['text'],
                          ),
                  ).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _buttons.map(
                    (button) => button['screen'] as Widget
            ).toList(),
          ),
        ),
        floatingActionButton: AddFABMenu(),
      ),
    );
  }
}
