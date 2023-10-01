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
  int currentIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.selected;
  bool showLeading = true;
  bool showTrailing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Row(
        children: [
          NavigationRail(
            destinations: const [
              NavigationRailDestination(
                  icon: Icon(Icons.home), label: Text('Home')),
              NavigationRailDestination(
                  icon: Icon(Icons.share), label: Text('Share')),
              NavigationRailDestination(
                  icon: Icon(Icons.note), label: Text('Note')),
            ],
            selectedIndex: currentIndex,
            labelType: labelType,
            leading: showLeading
                ? FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.add),
                  )
                : null,
            groupAlignment: -1,
            onDestinationSelected: (value) => setState(
              () {
                currentIndex = value;
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selected Index: $currentIndex',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Label type: ${labelType.name}',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  OverflowBar(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              labelType = NavigationRailLabelType.none;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('None'),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              labelType = NavigationRailLabelType.selected;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Selected'),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              labelType = NavigationRailLabelType.all;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('All'),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
