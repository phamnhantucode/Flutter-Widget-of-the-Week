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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _numDot = 3;
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _numDot, vsync: this);
  }

  void _incrementIndexTab() {
    setState(() {
      tabController?.index == _numDot - 1
          ? tabController?.index = 0
          : tabController?.index++;
    });
  }

  @override
  void dispose() {
    super.dispose();
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(children: [
          const Text("Tab page selector"),
          TabPageSelector(
            controller: tabController,
            indicatorSize: 20,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementIndexTab();
        },
        child:const Icon(Icons.add),
      ),
    );
  }
}
