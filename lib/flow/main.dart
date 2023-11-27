import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  var lastTap = Icons.access_alarm;
  List<IconData> icons = [
    Icons.home,
    Icons.mediation_outlined,
    Icons.access_alarm,
    Icons.menu
  ];

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  void _updateData(IconData iconData) {
    if (iconData != Icons.menu) {
      setState(() {
        lastTap = iconData;
      });
    }
  }

  Widget widgetIcon(IconData icon) {
    final size = MediaQuery.of(context).size.width / icons.length;

    return GestureDetector(
      onTap: () {
        _updateData(icon);
                  animationController?.status == AnimationStatus.completed
              ? animationController?.reverse()
              : animationController?.forward();
      },
      child: Container(
          constraints: BoxConstraints.tight(Size(size, size)),
          decoration: BoxDecoration(shape: BoxShape.circle, color: lastTap == icon ? Colors.amber : Colors.blue),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(icon),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Flow(
          delegate: FlowMenuDelegate(animation: animationController!),
          children: icons.map((e) => widgetIcon(e)).toList()),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  final Animation<double> animation;

  const FlowMenuDelegate({required this.animation}) : super(repaint: animation);

  @override
  void paintChildren(FlowPaintingContext context) {
    for (var i = 0; i <= context.childCount; i++) {
      var d = context.getChildSize(i)!.width * i;
      context.paintChild(i, transform: Matrix4.translationValues(d * animation.value, d * animation.value, 0));
    }
  }

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
