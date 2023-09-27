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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Autocomplete field'),
            const AutocompleteBasicExample(),
          ],
        ),
      ),
    );
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({super.key});

  static const List<String> _options = [
    'Trần Công Bảo',
    'Nguyễn Văn Nhân Sinh',
    'Trần Nhà Không Giới Hạn',
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (textEditingValue) {
        if (textEditingValue.text == '') return const Iterable.empty();
        return _options
            .where((element) => element.contains(textEditingValue.text));
      },
      onSelected: (option) {
        
      },
      optionsViewBuilder: (context, onSelected, options) {
        return ListView.builder(
          itemCount: options.length,
          itemBuilder: (context, index) {
            final option = options.elementAt(index);
            return GestureDetector(
              onTap: () => onSelected(option),
              child: Material(
                child: Text(option, style: TextStyle(
                  color: Colors.red, fontSize: 25
                ),)
              ),
            );
          },
        );
        
      },
    );
  }
}
