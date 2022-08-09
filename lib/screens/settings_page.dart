import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppThemeProvider>(context);
    Color iconColor=provider.isDarkMode ? Colors.white:Colors.black;
    return Column(
      children: [
        ThemeSwitcher(
          clipper: const ThemeSwitcherBoxClipper(),
          builder: (context){
            return SwitchListTile(
              value: provider.isDarkMode,
              onChanged: (bool value){
                provider.toggleTheme(!provider.isDarkMode);
              },
              title: Text("Dark mode", style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1, wordSpacing: 0.5),),
              secondary: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: provider.isDarkMode ? Icon(Icons.dark_mode_rounded, color: iconColor) : Icon(Icons.light_mode_rounded, color: iconColor,),
                switchInCurve: Curves.bounceIn,
              ),
            );
          }
        ),
        SwitchListTile(
          value: provider.isScaffoldBackgroundPhoto,
          onChanged: (bool value){
            provider.toggleBackground(!provider.isScaffoldBackgroundPhoto);
          },
          title: Text("Photo as background", style: TextStyle(fontWeight: FontWeight.w500, letterSpacing: 1, wordSpacing: 0.5),),
          secondary: AnimatedSwitcher(
            duration: Duration(milliseconds: 1000),
            child: provider.isScaffoldBackgroundPhoto ? Icon(Icons.image_rounded, color: iconColor,) : Icon(Icons.image_not_supported_rounded, color: iconColor,),
            switchInCurve: Curves.bounceIn,
          ),
        ),
      ],
    );
  }
}
