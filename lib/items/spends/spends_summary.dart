import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_dorm_life/items/spends/person_spend_card.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../theme_provider.dart';

class SpendsSummary extends StatefulWidget {
  const SpendsSummary({Key? key}) : super(key: key);

  @override
  State<SpendsSummary> createState() => _SpendsSummaryState();
}

class _SpendsSummaryState extends State<SpendsSummary> {

  int _slideIndex=0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppThemeProvider>(context);
    return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 100,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) =>
                  setState(()=> _slideIndex=index),
            ),
            items: [1,2,3,4,5].map((i) {
              return PersonSpendCard(name: "Shayan" + i.toString(), spend: 10*i.toDouble(), debt: 20*i.toDouble(),);
            }).toList(),
          ),
          SizedBox(height: 10,),
          AnimatedSmoothIndicator(
            activeIndex: _slideIndex,
            count: 5,
            effect: ScrollingDotsEffect(
              activeDotColor: provider.isDarkMode ? Colors.white:Colors.black87,
              dotColor: provider.isDarkMode ? Colors.white30:Colors.white70,
              activeStrokeWidth: 2.6,
              activeDotScale: 1.3,
              maxVisibleDots: 5,
              radius: 8,
              spacing: 10,
              dotHeight: 12,
              dotWidth: 12,
            ),
          ),
        ]
    );
  }
}
