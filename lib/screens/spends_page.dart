import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_dorm_life/items/person_spend_card.dart';
import 'package:my_dorm_life/items/spend_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SpendsPage extends StatefulWidget {
  const SpendsPage({Key? key}) : super(key: key);

  @override
  State<SpendsPage> createState() => _SpendsPageState();
}

class _SpendsPageState extends State<SpendsPage> {

  int _slideIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: ListView(
        children: [
          Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 100,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(()=> _slideIndex=index)
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
                  activeDotColor: Colors.blue.shade600,
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
          ),
          SizedBox(height: 5,),
          SpendCard(
            paidBy: 'Shayan',
            everyoneSpentMoney: {
              'Kian': 300,
              'Erfun': 400,
              'Amin': 500,
            },
          ),
        ],
      ),
    );
  }
}
