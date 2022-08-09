import 'package:flutter/material.dart';
import 'package:my_dorm_life/items/spends/detailed_spend_card.dart';

class SpendsDetailsList extends StatefulWidget {
  const SpendsDetailsList({Key? key}) : super(key: key);

  @override
  State<SpendsDetailsList> createState() => _SpendsDetailsListState();
}

class _SpendsDetailsListState extends State<SpendsDetailsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i=0; i<10; i++)
        SpendCard(
          paidBy: 'Shayan',
          everyoneSpentMoney: {
            'Kian': 300,
            'Erfun': 400,
            'Amin': 500,
          },
        ),
      ],
    );
  }
}
