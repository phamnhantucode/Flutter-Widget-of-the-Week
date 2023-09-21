import 'package:flutter/material.dart';
import 'package:widget_of_the_week/draggable/main.dart';
import 'package:widget_of_the_week/home_widgets/main.dart';

class DraggableTextPage extends StatelessWidget {
  const DraggableTextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyDraggableApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Draggable(
          feedback: buildTextContainer(
            text: 'Text Drag',
            color: Colors.purple,
          ),
          child: buildTextContainer(
            text: 'Drag me',
            color: Colors.purple,
          ),
          childWhenDragging: buildTextContainer(
            text: 'Behind',
            color: Colors.purple,
          ),
        ),
      ),
    );
  }

  Widget buildTextContainer({
    required String text,
    required Color color,
  }) =>
      Material(
        borderRadius: BorderRadius.circular(16),
        color: Colors.purple,
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: 140,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      );
}
