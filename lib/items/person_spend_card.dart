import 'package:flutter/material.dart';

class PersonSpendCard extends StatefulWidget {
  String name;
  double spend, debt;
  PersonSpendCard({Key? key, required this.name, required this.spend, required this.debt}) : super(key: key);

  @override
  State<PersonSpendCard> createState() => _PersonSpendCardState();
}

class _PersonSpendCardState extends State<PersonSpendCard> {


  late Map<String, bool> hasPaid;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_rounded, size: 30,),
                      SizedBox(width: 5,),
                      Text(widget.name, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Row(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.attach_money_rounded, size: 30, color: Colors.red,),
                          Text(widget.spend.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.red),),
                          SizedBox(width: 5,),
                          Text("Tomans", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.red),),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        children: [
                          Icon(Icons.credit_card_rounded, size: 30, color: Colors.green,),
                          SizedBox(width: 5,),
                          Text(widget.debt.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.green),),
                          SizedBox(width: 5,),
                          Text("Tomans", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300, color: Colors.green),),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
