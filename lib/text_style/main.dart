import 'dart:ui' as ui;

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Application',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Font weight: Bold',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Font style: Italics',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              Text(
                'Opacity 1 and color amber',
                style: TextStyle(color: Colors.amber.withOpacity(1)),
              ),
              Text(
                'Opacity 0.5 and color amber',
                style: TextStyle(color: Colors.amber.withOpacity(0.5)),
              ),
              const Text(
                'Size',
                style: TextStyle(fontSize: 35),
              ),
              const Text(
                'Text Decoration: underline',
                style: TextStyle(decoration: TextDecoration.underline),
              ),
              const Text(
                'Text Decoration: line through',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              Text(
                "Border and stroke",
                style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.6
                      ..color = Colors.pinkAccent),
              ),
              Stack(
                children: [
                  Text(
                    "Border, stroke and fill",
                    style: TextStyle(
                        fontSize: 40,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2.6
                          ..color = Colors.pinkAccent),
                  ),
                  Text(
                    "Border, stroke and fill",
                    style: TextStyle(fontSize: 40, color: Colors.blue[200]),
                  ),
                ],
              ),
              Text(
                'Gradient',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    foreground: Paint()
                      ..shader = ui.Gradient.linear(
                        const Offset(0, 90),
                        const Offset(150, 20),
                        <Color>[
                          Colors.red,
                          Colors.yellow,
                        ],
                      )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
