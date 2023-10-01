// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Flutter Demo',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//     home: HomePage(),
//   ));
// }

// class HomePage extends StatelessWidget {
//   final GlobalKey<_SharedPreferencesDemoState> globalKey = GlobalKey<_SharedPreferencesDemoState>();
//   HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//   void callFunctionChild() {
//     if (globalKey.currentState != null) {
      
//     log('add');
//       globalKey.currentState!.executionFunction();
//     }
//   }
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Page'),
//       ),
//       body: const SharedPreferencesDemo(),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         callFunctionChild();
//       }, child: Icon(Icons.add)),
//     );
//   }
// }

// class SharedPreferencesDemo extends StatefulWidget {
//   const SharedPreferencesDemo({super.key});

//   @override
//   State<SharedPreferencesDemo> createState() => _SharedPreferencesDemoState();
// }

// const counterKey = 'CounterKey';

// class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
//   Future<SharedPreferences> sharedPreferences = SharedPreferences.getInstance();
//   late Future<int> _counter;

//   void executionFunction() async {
//     log('add');
//     final pref = await sharedPreferences;
//     final counter = pref.getInt(counterKey) ?? 0 + 1;
//     setState(() {
//       _counter = pref.setInt(counterKey, counter).then((value) {
//         return counter;
//       });
//     });

//   }
//   @override
//   void initState() {
//     _counter = sharedPreferences.then((pref) =>
//         pref.getInt(counterKey) == null ? 0 : pref.getInt(counterKey)!);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _counter,
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.none:
//           case ConnectionState.waiting:
//             return const Placeholder();
//           case ConnectionState.active:
//           case ConnectionState.done:
//             return Center(
//               child: Text(snapshot.data.toString()),
//             );
//         }
//       },
//     );
//   }
// }


// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SharedPreferences Demo',
      home: SharedPreferencesDemo(),
    );
  }
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({super.key});

  @override
  SharedPreferencesDemoState createState() => SharedPreferencesDemoState();
}

class SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _counter;

  Future<void> _incrementCounter() async {
    final SharedPreferences prefs = await _prefs;
    final int counter = (prefs.getInt('counter') ?? 0) + 1;

    setState(() {
      _counter = prefs.setInt('counter', counter).then((bool success) {
        return counter;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _counter = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Demo'),
      ),
      body: Center(
          child: FutureBuilder<int>(
              future: _counter,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        'Button tapped ${snapshot.data} time${snapshot.data == 1 ? '' : 's'}.\n\n'
                        'This should persist across restarts.',
                      );
                    }
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}