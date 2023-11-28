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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<bool> _isOpen = List.filled(3, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ExpansionPanelList(
            children: _isOpen
                .map((e) => ExpansionPanel(
                    isExpanded: e,
                    headerBuilder: (context, isExpanded) {
                      return const Text('Expanded');
                    },
                    body: const Text('Open')))
                .toList(),
                expansionCallback: (panelIndex, isExpanded) {
                  setState(() {
                    _isOpen[panelIndex] = !_isOpen[panelIndex];
                  });
                },
          ),
        ),
      ),
    );
  }
}
