import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:my_dorm_life/screens/spends_page.dart';
import 'package:my_dorm_life/screens/test_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  final List<Map<String, dynamic>> _buttons=[
    {
      'minWidth' : 30.0,
      'icon' : Icons.home_filled,
      'icon_size' : 30.0,
      'text' : 'Home',
      'screen' : TestScreen(),
      'tab' : 0,
    },
    {
      'minWidth' : 30.0,
      'icon' : Icons.attach_money_sharp,
      'icon_size' : 30.0,
      'text' : 'Spends',
      'screen' : SpendsPage(),
      'tab' : 1,
    },
    {
      'minWidth' : 30.0,
      'icon' : Icons.today_sharp,
      'icon_size' : 30.0,
      'text' : 'Plans',
      'screen' : TestScreen(),
      'tab' : 2,
    },
    {
      'minWidth' : 30.0,
      'icon' : Icons.settings_sharp,
      'icon_size' : 30.0,
      'text' : 'Settings',
      'screen' : TestScreen(),
      'tab' : 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).appBarTheme.backgroundColor,
    ));
    return DefaultTabController(
      length: _buttons.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Text('My Dorm Life'),
                leading: Icon(Icons.bed_rounded, size: 30,),
                titleSpacing: 0,
                forceElevated: true,
                // elevation: 2,
                floating: true,
                pinned: true,
                snap: true,
                bottom: TabBar(
                  tabs: _buttons.map(
                          (button) =>
                          Tab(
                            icon: Icon(
                              button['icon'],
                            ),
                            text: innerBoxIsScrolled ? null:button['text'],
                          )
                  ).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Text("test 1"),
              SpendsPage(),
              Text("test 3"),
              Text("test 4"),
            ],
          ),
        ),
        floatingActionButton: ExpandableFab(
          distance: 60.0,
          type: ExpandableFabType.fan,
          fanAngle: 120,
          child: const Icon(Icons.add_rounded),
          closeButtonStyle: const ExpandableFabCloseButtonStyle(
            child: Icon(Icons.close_rounded),
            foregroundColor: Colors.grey,
            backgroundColor: Colors.white,
          ),
          overlayStyle: ExpandableFabOverlayStyle(
            color: Colors.black.withOpacity(0.5),
            // blur: 5,
          ),
          children: [
            FloatingActionButton(
              elevation: 0,
              onPressed: () {  },
              child: const Icon(Icons.add_task_rounded),
            ),
            FloatingActionButton(
              elevation: 0,
              onPressed: () {  },
              child: const Icon(Icons.person_add_alt_1_rounded),
            ),
            FloatingActionButton(
              elevation: 0,
              onPressed: () {  },
              child: const Icon(Icons.add_card_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
