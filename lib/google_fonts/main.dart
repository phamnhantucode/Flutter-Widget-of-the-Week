import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: const Text('Google Fonts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fetching font from internet...',
              style: GoogleFonts.dancingScript(fontSize: 30),
            ),
            Text('Fetching font from local...', style: GoogleFonts.lobster(
              fontSize: 30,
              color: Colors.red
            ),),

          ],
        ),
      ),
    );
  }
}
