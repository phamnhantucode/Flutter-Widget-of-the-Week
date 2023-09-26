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
      body: Material(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple, Colors.blue, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment(0.5, 1))),
          child: Center(
            child: ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 252, 192, 255),
                Color.fromARGB(255, 255, 84, 206),
                Color.fromARGB(255, 172, 172, 37),
                Color(0xffca485c),
                Color.fromARGB(255, 90, 230, 242),
                Color(0xfff39060),
                Color.fromARGB(255, 184, 255, 107),
              ],).createShader(bounds),
              child: const Text(
                'Linear Gradient',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
