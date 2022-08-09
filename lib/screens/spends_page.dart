import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_dorm_life/items/spends/spends_details_list.dart';
import 'package:my_dorm_life/items/spends/spends_summary.dart';
import 'package:my_dorm_life/items/spends/person_spend_card.dart';
import 'package:my_dorm_life/items/spends/detailed_spend_card.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_dorm_life/items/add_FAB_menu.dart';

import '../theme_provider.dart';

class SpendsPage extends StatefulWidget {
  const SpendsPage({Key? key}) : super(key: key);

  @override
  State<SpendsPage> createState() => _SpendsPageState();
}

class _SpendsPageState extends State<SpendsPage> {



  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppThemeProvider>(context);
    return Stack(
      children: [
        provider.isScaffoldBackgroundPhoto ? Image.asset(
          provider.isDarkMode ? "assets/images/dark_wallpaper.jpg":"assets/images/wallpaper.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ) : SizedBox(),
        Scaffold(
          // backgroundColor: Colors.blue[300],
          backgroundColor: provider.isScaffoldBackgroundPhoto ? Colors.transparent:Colors.lightBlue[300],
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text("Summary", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ),
              SpendsSummary(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   child: Divider(thickness: 2, color: Colors.black87,),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 7,),
                child: Text("Details", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ),
              SpendsDetailsList(),
              SizedBox(height: 80,),
            ],
          ),
        ),
      ]
    );
  }
}
