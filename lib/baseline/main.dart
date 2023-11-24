import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final double fontSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Baseline Example'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Baseline(
                baseline: fontSize,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'Hello',
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              const SizedBox(width: 16.0),
              Baseline(
                baseline: fontSize,
                baselineType: TextBaseline.alphabetic,
                child: Text(
                  'World',
                  style: TextStyle(fontSize: fontSize * 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}