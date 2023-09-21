import 'package:flutter/material.dart';
import 'package:widget_of_the_week/draggable/main.dart';

Widget buildAppBar({required int score}) {
  const double height = 52;
  return AppBar(
    title: const Text(MyDraggableApp.title),
    centerTitle: true,

    //custom app bar
    bottom: PreferredSize(
        preferredSize:const Size.fromHeight(height),
        child: Container(
          alignment: Alignment.center,
          height: height,
          child: _buildScore(score),
        )),
  );
}

Widget _buildScore(int score) {
  const textStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        'Score: ',
        style: textStyle,
      ),
      SizedBox(
          width: 60,
          child: Text(
            '$score',
            style: textStyle,
            textAlign: TextAlign.right,
          ))
    ],
  );
}
