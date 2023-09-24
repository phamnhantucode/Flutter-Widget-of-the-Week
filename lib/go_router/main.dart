import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

//GoRouter config
final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => Scaffold(
      appBar: AppBar(
          title: const Text('Hole router'),
          ),
      body: const CircularProgressIndicator(),
    ),
  )
]);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
