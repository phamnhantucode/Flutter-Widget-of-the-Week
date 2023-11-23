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
      body: const Center(
        child: DropdownButtonExample(),
      ),
    );
  }
}

const listItem = ['first', 'second', 'third', 'four'];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = listItem.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: DropdownButton(
          value: dropdownValue,
          focusColor: Colors.transparent,
          underline: const SizedBox(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          isExpanded: true,
          items: listItem
              .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem<String>(value: e, child: Text(e)))
              .toList(),
          onChanged: (String? value) {
            if (listItem.contains(value)) {
              setState(() {
                dropdownValue = value!;
              });
            }
          }),
    );
  }
}
