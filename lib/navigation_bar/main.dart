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
      body: const NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;
  @override
  Widget build(BuildContext context) {
    List<Widget> listButton = [
      ElevatedButton(
        onPressed: () {
          setState(() {
            labelBehavior = NavigationDestinationLabelBehavior.alwaysShow;
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('alwaysShow'),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('onlyShowSelected'),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            labelBehavior = NavigationDestinationLabelBehavior.alwaysHide;
          });
        },
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('alwaysHide'),
        ),
      ),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blue[100],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
            selectedIcon: Icon(Icons.home_outlined),
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Business',
            selectedIcon: Icon(Icons.business_outlined),
          ),
          NavigationDestination(
            icon: Icon(Icons.school),
            label: 'School',
            selectedIcon: Icon(Icons.school_outlined),
          ),
        ],
      ),
      body: <Widget>[
        PageNavigationExample(color: Colors.red, listWidget: listButton),
        PageNavigationExample(color: Colors.green, listWidget: listButton),
        PageNavigationExample(color: Colors.yellow, listWidget: listButton),
      ][currentPageIndex],
    );
  }
}

class PageNavigationExample extends StatelessWidget {
  final Color color;
  final List<Widget> listWidget;

  const PageNavigationExample(
      {super.key, required this.color, required this.listWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listWidget
          .map((e) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: e,
              )).toList(),
      ),
    );
  }
}
