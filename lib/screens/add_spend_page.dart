import 'package:flutter/material.dart';

class AddSpendPage extends StatelessWidget {
  const AddSpendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        titleSpacing: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text("Add New Spend", style: TextStyle(color: Colors.black),),
      ),
      // body: ,
    );
  }
}
