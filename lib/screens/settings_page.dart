import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rainbow_color/rainbow_color.dart';
import '../theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Color> _colorAnim;
  late Animation<Color> _iconColorAnim;

  int selected_theme_id=AppThemeProvider().themeID;

  List<Map<String, dynamic>> _themeOptions=[
    {
      'icon' : Icons.light_mode_rounded,
      'off_icon' : Icons.light_mode_outlined,
      'text' : 'Light',
      'icon_color' : Colors.grey[900],
      'background_color' : Colors.grey[100],
      'radio_color' : Colors.grey[900],
      'rainbow' : false,
      'value' : 0,
    },
    {
      'icon' : Icons.dark_mode_rounded,
      'off_icon' : Icons.dark_mode_outlined,
      'text' : 'Dark',
      'icon_color' : Colors.grey[100],
      'background_color' : Colors.grey[900],
      'radio_color' : Colors.grey[100],
      'rainbow' : false,
      'value' : 1,
    },
    {
      'icon' : Icons.phone_android,
      'off_icon' : Icons.phone_android,
      'text' : 'System',
      'icon_color' : Colors.grey,
      'background_color' : Colors.grey,
      'radio_color' : Colors.grey,
      'rainbow' : true,
      'value' : 2,
    },
  ];


  @override
  void initState(){
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );
    _colorAnim = RainbowColorTween([
      Colors.grey.shade900,
      Colors.grey.shade100,
      Colors.grey.shade900,
    ])
        .animate(controller)
      ..addListener(() { setState(() {}); })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    _iconColorAnim = RainbowColorTween([
      Colors.grey.shade100,
      Colors.grey.shade900,
      Colors.grey.shade100,
    ])
        .animate(controller)
      ..addListener(() { setState(() {}); })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reset();
          controller.forward();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppThemeProvider>(context);
    Color iconColor=provider.isDarkMode ? Colors.white:Colors.black;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.color_lens_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 17),
                    child: Text("Theme Mode", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, letterSpacing: 1, wordSpacing: 0.5),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _themeOptions.map(
                  (option) =>
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            selected_theme_id=option['value'];
                            provider.changeTheme(option['value']);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: option['rainbow'] ? _colorAnim.value : option['background_color'],
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 5),
                                child: Icon(option['icon'], size: 30 ,color: option['rainbow'] ? _iconColorAnim.value:option['icon_color'],),
                              ),
                              Radio(
                                fillColor: MaterialStateProperty.resolveWith<Color>((states) => option['rainbow'] ? _iconColorAnim.value:option['radio_color']),
                                value: option['value'] as int,
                                groupValue: selected_theme_id,
                                onChanged: (value){
                                  selected_theme_id=option['value'];
                                  provider.changeTheme(option['value']);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(option['text'], style: TextStyle(fontWeight: FontWeight.w600),),
                        ),
                      ],
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
        SwitchListTile(
          activeColor: Colors.blue,
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
          subtitle: provider.isScaffoldBackgroundPhoto ? Text("Some backgrounds may contain image"):Text("All backgrounds are solid colors"),
        ),
      ],
    );
  }
}
