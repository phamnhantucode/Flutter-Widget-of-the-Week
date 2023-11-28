import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
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
  double x = 0.0;
  double y = 0.0;

  void _updatePosition(PointerHoverEvent event) {
    setState(() {
      x = event.position.dx;
      y = event.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: _updatePosition,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: ColoredBox(
            color: Colors.blue.shade100,
            child: Text('Current position of mouse: x = $x, y = $y'),
          ),
        ),
      ),
    );
  }
}
