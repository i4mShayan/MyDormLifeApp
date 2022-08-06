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
    return Stack(
      children: [
        Image.asset(
          "assets/images/wallpaper.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          // backgroundColor: Colors.blue[300],
          backgroundColor: Colors.transparent,
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 10),
                child: Text("Summary of Spends", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ),
              Column(
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
                        activeDotColor: Colors.black87,
                        dotColor: Colors.white60,
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
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              //   child: Divider(thickness: 2, color: Colors.black87,),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 7,),
                child: Text("Spends Details", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
              ),
              SpendCard(
                paidBy: 'Shayan',
                everyoneSpentMoney: {
                  'Kian': 300,
                  'Erfun': 400,
                  'Amin': 500,
                },
              ),              SpendCard(
                paidBy: 'Shayan',
                everyoneSpentMoney: {
                  'Kian': 300,
                  'Erfun': 400,
                  'Amin': 500,
                },
              ),
            ],
          ),
        ),
      ]
    );
  }
}
