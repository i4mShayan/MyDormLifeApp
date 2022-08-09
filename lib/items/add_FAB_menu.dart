import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:my_dorm_life/screens/add_spend_page.dart';

class AddFABMenu extends StatefulWidget {
  const AddFABMenu({Key? key}) : super(key: key);

  @override
  State<AddFABMenu> createState() => _AddFABMenuState();
}

class _AddFABMenuState extends State<AddFABMenu>{

  var _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      key: _key,
      distance: 60.0,
      type: ExpandableFabType.fan,
      fanAngle: 120,
      child: const Icon(Icons.add),
      closeButtonStyle: const ExpandableFabCloseButtonStyle(
        child: Icon(Icons.close),
        foregroundColor: Colors.grey,
        backgroundColor: Colors.white,
      ),
      overlayStyle: ExpandableFabOverlayStyle(
        color: Colors.black.withOpacity(0.8),
        // blur: 2,
      ),
      children: [
        FloatingActionButton(
          elevation: 0,
          onPressed: () {  },
          child: const Icon(Icons.add_task_rounded),
        ),
        FloatingActionButton(
          elevation: 0,
          onPressed: () {  },
          child: const Icon(Icons.person_add_alt_1_rounded),
        ),
        FloatingActionButton(
          elevation: 0,
          onPressed: () {
            _key.currentState!.dispose();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddSpendPage()),
            ).then((value){
              setState((){
                _key=GlobalKey<ExpandableFabState>();
              });
            });
          },
          child: const Icon(Icons.add_card_rounded),
        ),
      ],
    );
  }
}
