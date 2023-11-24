import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    )
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Container(
        child: Center(
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/3000/3000',
            progressIndicatorBuilder: (context, url, progress) {
              final result = progress.progress ?? 0 * 100;
              return Text('$result');
            },
            ),
        ),
      ),
    );
  }
}
