import 'package:flutter/material.dart';
import 'package:my_dorm_life/items/spend_card.dart';

class SpendsPage extends StatefulWidget {
  const SpendsPage({Key? key}) : super(key: key);

  @override
  State<SpendsPage> createState() => _SpendsPageState();
}

class _SpendsPageState extends State<SpendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => SpendCard(
          paidBy: 'Shayan',
          everyoneSpentMoney: {
            'Kian': 300,
            'Erfun': 400,
            'Amin': 500,
          },
        ),
      ),
    );
  }
}
