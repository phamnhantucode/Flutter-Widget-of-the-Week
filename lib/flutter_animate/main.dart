import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() {
  runApp(const MyFlutterAnimateApp());
}

class MyFlutterAnimateApp extends StatelessWidget {
  static List<Effect> transitionIn = <Effect>[
    FadeEffect(duration: 500.ms, curve: Curves.easeOut),
    const ScaleEffect(),
  ];

  const MyFlutterAnimateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade50),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Animate'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Animate(
                effects: const [FadeEffect(), ScaleEffect()],
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber.shade100,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Hello World',
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Similar above',
                  ),
                ),
              ).animate().fade().scale(),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hello World',
                  ),
                ),
              ).animate().fade(duration: 1000.ms).scale(duration: 700.ms),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hello World',
                  ),
                ),
              )
                  .animate()
                  .fade()
                  .scale()
                  .move(delay: 100.ms, duration: 1500.ms)
                  .blur(delay: 1500.ms),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hello World',
                  ),
                ),
              )
                  .animate(
                    delay: 1000.ms,
                    onPlay: (controller) {
                      controller.repeat();
                    },
                  )
                  .fadeIn(duration: 1700.ms)
                  .fadeOut(delay: 1700.ms),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    'Hello World',
                  ).animate(
                    onPlay: (controller) {
                      controller.repeat();
                    },
                  ).tint(color: Colors.pinkAccent),
                ),
              )
                  .animate(
                    delay: 1000.ms,
                    onPlay: (controller) {
                      controller.repeat();
                    },
                  )
                  .fade(end: 0.5, duration: 900.ms)
                  .tint(color: Colors.blueAccent),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hello world',
                  ),
                ),
              )
                  .animate()
                  .fade(begin: .5, duration: 700.ms)
                  .then(delay: 1000.ms)
                  .scale(begin: const Offset(.5, .5)),
              const SizedBox(
                height: 20,
              ),

              //reuse list effect has been defined previous
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hello world',
                  ),
                ),
              ).animate(effects: transitionIn),

              const SizedBox(
                height: 20,
              ),
              const Text("Hello World").animate().custom(
                  duration: 1000.ms,
                  builder: (context, value, child) => Container(
                        color: Color.lerp(Colors.red, Colors.blue, value),
                        padding: EdgeInsets.all(8),
                        child: child, // child is the Text widget being animated
                      )),
              const SizedBox(
                height: 20,
              ),
              Animate().toggle(
                duration: 1.ms,
                builder: (_, value, __) => AnimatedContainer(
                  duration: 1.seconds,
                  color: value ? Colors.red : Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Hello world',
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.amber.shade100,
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Hello world',
                  ),
                ),
              ).animate(delay: 1500.ms).fadeOut(duration: 500.ms).swap(
                    builder: (_, child) =>
                        child!.animate().fadeIn(duration: 1000.ms),
                  ),

              const SizedBox(
                height: 20,
              ),

              const Text("Hello").animate().fadeIn(curve: Curves.easeOutExpo, duration: 2000.ms).listen(
                  callback: (value) => print('current opacity: $value')),

              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )),
      ),
    );
  }
}
