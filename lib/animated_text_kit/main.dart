import 'package:animated_text_kit/animated_text_kit.dart';
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
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                  height: 100,
                ),
                const Text(
                  'Be',
                  style: TextStyle(fontSize: 43),
                ),
                const SizedBox(
                  width: 20,
                  height: 100,
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40,
                    fontFamily: 'Horizon',
                  ),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        RotateAnimatedText('AWESOME'),
                        RotateAnimatedText('DIFFERENCE'),
                        RotateAnimatedText('BEAUTIFUL'),
                      ],
                      onTap: () {},
                      stopPauseOnTap: true,
                    ),
                  ),
                )
              ]),
              SizedBox(
                width: 250,
                child: DefaultTextStyle(
                  style: GoogleFonts.ephesis(fontSize: 30),
                  child: AnimatedTextKit(animatedTexts: [
                    FadeAnimatedText('AWE'),
                    FadeAnimatedText('AWES'),
                    FadeAnimatedText('AWESO'),
                    FadeAnimatedText('AWESOM'),
                    FadeAnimatedText('AWESOME'),
                  ]),
                ),
              )
        ],
      ),
    );
  }
}
