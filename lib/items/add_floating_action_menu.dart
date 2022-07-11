import 'package:flutter/material.dart';
import 'dart:math';

class AddFloatingMenu extends StatefulWidget {
  const AddFloatingMenu({Key? key}) : super(key: key);

  @override
  State<AddFloatingMenu> createState() => _AddFloatingMenuState();
}

class _AddFloatingMenuState extends State<AddFloatingMenu> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation _animation;
  late double distance;
  late double buttonSize;

  @override
  void initState(){
    distance=70;
    buttonSize=40;
    _animationController=AnimationController(vsync: this, duration: Duration(microseconds: 200));
    _animation=Tween(begin: 0, end: 1).animate(_animationController);
    _animationController.addListener(() {
      setState((){});
    });
    super.initState();
  }

  double toRadian(double degree){
    return degree*pi/180;
  }

  void onPressedAnimationAction(){
    if(_animationController.isCompleted){
      _animationController.reverse();
    }
    else{
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform.translate(
          offset: Offset.fromDirection(toRadian(270+57), _animation.value*distance),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {  },
            child: const Icon(Icons.add_task_rounded),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(toRadian(270), _animation.value*distance),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {  },
            child: const Icon(Icons.person_add_alt_1_rounded),
          ),
        ),
        Transform.translate(
          offset: Offset.fromDirection(toRadian(270-57), _animation.value*distance),
          child: FloatingActionButton(
            elevation: 0,
            onPressed: () {  },
            child: const Icon(Icons.add_card_rounded),
          ),
        ),
        FloatingActionButton(
          backgroundColor: _animationController.isCompleted ? Colors.white:null,
          onPressed: () {
            onPressedAnimationAction();
          },
          child: _animationController.isCompleted ? Icon(Icons.close_rounded, color: Colors.grey,):Icon(Icons.add_rounded),
        ),
      ],
    );
  }
}
