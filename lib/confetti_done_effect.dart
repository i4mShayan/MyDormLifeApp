import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class ConfettiDoneEffect extends StatefulWidget {
  final Widget child;

  const ConfettiDoneEffect({required this.child,Key? key}) : super(key: key);
  @override
  _ConfettiDoneEffectState createState() => _ConfettiDoneEffectState();
}

class _ConfettiDoneEffectState extends State<ConfettiDoneEffect> {
  late ConfettiController controller;

  @override
  void initState() {
    super.initState();

    controller = ConfettiController(duration: Duration(seconds: 5));
    controller.play();
  }

  static final double right = 0;
  static final double down = pi / 2;
  static final double left = pi;
  static final double top = -pi / 2;

  final double blastDirection = left;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (controller.state == ConfettiControllerState.playing) {
          controller.stop();
        } else {
          controller.play();
        }
      },
      child: Stack(
        children: [
          widget.child,
          buildConfetti(),
        ],
      ),
    );
  }

  Widget buildConfetti() => Align(
    alignment: Alignment.center,
    child: ConfettiWidget(
      confettiController: controller,
      colors: [
        Colors.red,
        Colors.blue,
        Colors.orange,
        Colors.purple,
        Colors.lightBlue,
      ],
      //blastDirection: blastDirection,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: true,
      emissionFrequency: 0.05,
      numberOfParticles: 5,
      gravity: 0.2,
      maxBlastForce: 2,
      minBlastForce: 1,
      particleDrag: 0.1,
    ),
  );
}