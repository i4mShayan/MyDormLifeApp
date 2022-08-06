import 'package:flutter/material.dart';

class SpendCard extends StatefulWidget {
  String paidBy;
  Map<String, double> everyoneSpentMoney;
  SpendCard({Key? key, required this.paidBy, required this.everyoneSpentMoney}) : super(key: key);

  @override
  State<SpendCard> createState() => _SpendCardState();
}

class _SpendCardState extends State<SpendCard> {


  late Map<String, bool> hasPaid;

  @override
  void initState(){
    super.initState();
    hasPaid={};
    widget.everyoneSpentMoney.forEach((key, value) {
      hasPaid.addAll({key : false});
    });
  }
  double sumOfSpent(){
    double sum=0;
    widget.everyoneSpentMoney.forEach((key, value) {
      sum+=value;
    });
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.attach_money_rounded),
                  SizedBox(width: 5,),
                  Text(sumOfSpent().toString(), style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                  SizedBox(width: 5,),
                  Text("Tomans",  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),),
                  Spacer(),
                  Icon(Icons.credit_card_rounded),
                  SizedBox(width: 7,),
                  Text(widget.paidBy),
                ],
              ),
              SizedBox(height: 5,),
              Divider(),
              Column(
                children: widget.everyoneSpentMoney.keys.map((person) =>
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.black87,
                            shape: CircleBorder(),
                            value: hasPaid[person],
                            onChanged: (bool? value) {
                              setState(() {
                                hasPaid[person]=value!;
                              });
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person_rounded),
                                  SizedBox(width: 5,),
                                  Text(person, style: TextStyle(decoration: (hasPaid[person]! ? TextDecoration.lineThrough:null)),),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(hasPaid[person]! ? Icons.money_off_rounded:Icons.attach_money_rounded),
                                  Text(widget.everyoneSpentMoney[person].toString(), style: TextStyle(decoration: (hasPaid[person]! ? TextDecoration.lineThrough:null)),),
                                  SizedBox(width: 5,),
                                  Text("Tomans",  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, decoration: (hasPaid[person]! ? TextDecoration.lineThrough:null)),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
