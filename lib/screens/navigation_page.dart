import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_dorm_life/items/add_floating_action_menu.dart';
import 'package:my_dorm_life/screens/spends_page.dart';
import 'package:my_dorm_life/screens/test_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int currentTab=0;
  final List<Widget> screens=[
    const TestScreen(),
  ];

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=const TestScreen();
  AddFloatingMenu addFloatingMenu=AddFloatingMenu();

  final List<Map<String, dynamic>> _leftButtons=[
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
  ];

  final List<Map<String, dynamic>> _rightButtons=[
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
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.bed_rounded, size: 30,),
        titleSpacing: 0,
        title: Text('My Dorm Life'),
        elevation: 0,
        // toolbarHeight: 50,
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AddFloatingMenu(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _leftButtons.map((button) =>
                    MaterialButton(
                      minWidth: button['minWidth'],
                      onPressed: (){
                        setState((){
                          currentScreen = button['screen'];
                          currentTab = button['tab'];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            button['icon'],
                            size: button['icon_size'],
                            color: currentTab==button['tab'] ? Colors.blue:Colors.grey,
                          ),
                          Text(
                            button['text'],
                            style: TextStyle(
                              color: currentTab==button['tab'] ? Colors.blue:Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                ).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _rightButtons.map((button) =>
                    MaterialButton(
                      minWidth: button['minWidth'],
                      onPressed: (){
                        setState((){
                          currentScreen = button['screen'];
                          currentTab = button['tab'];
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            button['icon'],
                            size: button['icon_size'],
                            color: currentTab==button['tab'] ? Colors.blue:Colors.grey,
                          ),
                          Text(
                            button['text'],
                            style: TextStyle(
                              color: currentTab==button['tab'] ? Colors.blue:Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
