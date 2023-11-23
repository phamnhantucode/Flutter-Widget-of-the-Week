import 'package:flutter/material.dart';

var text = 'Hello world';

class MyStateless extends StatelessWidget {
  final Function() onTap;

  const MyStateless({required Function() this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        Text(text),
        TextButton(onPressed: onTap, child: Text('Button'))
      ],
    );
  }
}

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
        child: StatefulBuilder(
          builder: (context, setState) => MyStateless(
            onTap: () {
              setState(() => text = 'Xin chào',);
            },
          ),
        ),
      ),
    );
  }
}
