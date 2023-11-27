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
      body: Hero(
        tag: 'text',
        child: Text(
        '''Trong vùng đồng cỏ xanh mướt, những bông hoa nhiều màu sắc nở rộ, 
            tạo nên một khung cảnh tuyệt đẹp. Những con chim hót líu lo trên những cành cây,
             tạo nên một điệu nhảy đầy vui tươi. Một cơn gió nhẹ thoảng qua mang theo hương thơm tự nhiên của đất trời. 
             Trong không gian yên bình này, tôi cảm nhận được sự hài hòa và thanh thản tâm hồn.'''),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const DetailPage()));
        },
        child: const Icon(Icons.ac_unit),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Image.network('https://picsum.photos/200/300'),
          const Hero(
            tag: 'text',
            child: Text(
                '''Trong vùng đồng cỏ xanh mướt, những bông hoa nhiều màu sắc nở rộ, 
                  tạo nên một khung cảnh tuyệt đẹp. Những con chim hót líu lo trên những cành cây,
                   tạo nên một điệu nhảy đầy vui tươi. Một cơn gió nhẹ thoảng qua mang theo hương thơm tự nhiên của đất trời. 
                   Trong không gian yên bình này, tôi cảm nhận được sự hài hòa và thanh thản tâm hồn.'''),
          )
        ],
      ),
    );
  }
}
