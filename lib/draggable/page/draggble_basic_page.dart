import 'package:flutter/material.dart';
import 'package:widget_of_the_week/draggable/data/data.dart';

class DraggableBasicPage extends StatefulWidget {
  const DraggableBasicPage({super.key});

  @override
  State<DraggableBasicPage> createState() => _DraggableBasicPageState();
}

class _DraggableBasicPageState extends State<DraggableBasicPage> {

  final List<Animal> all = allAnimals;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}