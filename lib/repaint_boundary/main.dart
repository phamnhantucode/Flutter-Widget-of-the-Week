//keep in mind that don't abuse repaint boundary too much
//because it take a little bit of memory and cpu space when launch
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isRepaintActive = false;

  void onToggleRepaint(bool newVal) => setState(() {
        isRepaintActive = newVal;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('RepaintBoundary?'),
              CupertinoSwitch(
                value: isRepaintActive,
                onChanged: onToggleRepaint,
              ),
            ],
          ),
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isRepaintActive
                    ? const RepaintBoundary(
                        child: RotatingWidget(),
                      )
                    : const RotatingWidget(),
                const StableWidget(),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class StableWidget extends StatelessWidget {
  const StableWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: ColoredBox(
        color: Colors.orange,
        child: Center(child: Text('Stable Widget')),
      ),
    );
  }
}

class RotatingWidget extends StatefulWidget {
  const RotatingWidget({super.key});

  @override
  State<RotatingWidget> createState() => _RotatingWidgetState();
}

class _RotatingWidgetState extends State<RotatingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Tween<double> _animate;
  double rotate = 0;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animate = Tween<double>(begin: 0, end: 1);
    _animate.animate(_controller).addListener(() {
        setState(() {
          rotate = _controller.value * pi * 2;
        });
      });
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotate,
      child: const Text('I am rotating!!!'),
    );
  }
}
