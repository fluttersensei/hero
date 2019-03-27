import 'package:flutter/material.dart';
import 'package:hero/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Donuts Shop',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Donuts Shop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 30,
          children: List.generate(6, (index) {
            var i = index + 1;

            return InkWell(
              child: Hero(
                tag: 'donut' + (i).toString(),
                child: Image.asset('images/donuts' + (i).toString() + '.png'),
              ),
              onTap: () => _showDonutDetail(i),
            );
          }),
        ),
      ),
    );
  }

  void _showDonutDetail(int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailPage(id);
        },
      ),
    );
  }
}
