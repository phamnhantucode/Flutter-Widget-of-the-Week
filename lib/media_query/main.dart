import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
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
        child: MaterialButton(
          onPressed: () {
            log('${MediaQuery.of(context).size.height}');
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(constraints.minWidth.toString());
            },
          ),
        ),
      ),
    );
  }
}
