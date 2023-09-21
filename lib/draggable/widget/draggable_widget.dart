import 'package:flutter/material.dart';
import 'package:widget_of_the_week/draggable/data/data.dart';

class DraggableWidget extends StatelessWidget {
  final Animal animal;
  static double size = 150;

  const DraggableWidget({super.key, required this.animal});

  @override
  Widget build(BuildContext context) => Draggable<Animal>(
        data: animal,
        feedback: buildImage(),
        childWhenDragging: Container(height: size),
        child: buildImage(),
      );

  Widget buildImage() => Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Image.asset(animal.imageUrl),
      );
}
