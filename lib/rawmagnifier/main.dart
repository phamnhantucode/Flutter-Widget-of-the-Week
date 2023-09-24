import 'package:flutter/material.dart';

void main() {
  runApp(const MyRawMagnifier());
}

class MyRawMagnifier extends StatefulWidget {
  const MyRawMagnifier({super.key});

  @override
  State<MyRawMagnifier> createState() => _MyRawMagnifierState();
}

class _MyRawMagnifierState extends State<MyRawMagnifier> {
  Offset dragGesturePosition = Offset.zero;
  bool isPan = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Drag on the logo'),
            RepaintBoundary(
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onPanStart: (details) => setState(() {
                      isPan = true;
                      dragGesturePosition = details.localPosition;
                    }),
                    onPanEnd: (_) => setState(() {
                      isPan = false;
                    }),
                    onPanUpdate: (DragUpdateDetails details) => setState(() {
                      dragGesturePosition = details.localPosition;
                    }),
                    child: const FlutterLogo(
                      size: 200,
                    ),
                  ),
                  Positioned(
                      left: dragGesturePosition.dx - 90,
                      top: dragGesturePosition.dy - 90,
                      child: Visibility(
                        visible: isPan,
                        child: const RawMagnifier(
                          decoration: MagnifierDecoration(
                              shape: CircleBorder(
                                  side: BorderSide(
                            color: Colors.yellowAccent,
                            width: 3,
                          ))),
                          size: Size(100, 100),
                          magnificationScale: 1.5,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

