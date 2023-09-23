import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_of_the_week/draggable/page/draggable_text_page.dart';

Future main() async {
  // ensure the necessary bindings and initialization of Flutter are perform before running the application
  // If application does not require any early initialization, such as accessing platform channels or services, we can omit this line.
  WidgetsFlutterBinding.ensureInitialized();

  //restricts the application to only support portrait mode and prevents automatic orientation changes.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyDraggableApp());
}

class MyDraggableApp extends StatelessWidget {
  static const String title = 'Draggable & DragTarget';


  const MyDraggableApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove the debug banner at the top right of screen
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        primaryColor:  Colors.blueAccent,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomNavigationBar(),
    );

  }

  Widget buildBody() {
    switch (index) {
      case 0:
      return const DraggableTextPage();
      case 1:
      case 2:
      default:
      return Container();
    }
  }

  Widget buildBottomNavigationBar() {
    const style = TextStyle(color: Colors.white);
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      onTap: (value) {
        setState(() {
          index = value;
        });
      },
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Text('Draggable', style: style),
          label: 'Text'
        ),
        BottomNavigationBarItem(
          icon: Text('Draggable', style: style),
          label: 'Basic'
        ),
        BottomNavigationBarItem(
          icon: Text('Draggable', style: style),
          label: 'Advanced'
        ),
        
      ],
    );
  }
}