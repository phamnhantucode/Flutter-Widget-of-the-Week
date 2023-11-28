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
      body: Scrollbar(
          thumbVisibility: true,
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(title: Text("Item $index"));
            },
          )),
    );
  }
}
