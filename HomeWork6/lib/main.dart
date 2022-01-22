import 'package:flutter/material.dart';
import 'package:homework6/pages/rel_4_page.dart';
import 'package:homework6/pages/rel_3_page.dart';
import 'package:homework6/pages/rel_2_page.dart';
import 'package:homework6/pages/rel_1_page.dart';
import 'package:homework6/pages/rel_5_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _buildPageBtn(String name, Widget page) {
    void onPressed() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: Text(name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home work 6')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPageBtn('Rel 1', const Rel1Page()),
            _buildPageBtn('Rel 2', const Rel2Page()),
            _buildPageBtn('Rel 3', const Rel3Page()),
            _buildPageBtn('Rel 4', const Rel4Page()),
            _buildPageBtn('Rel 5', const Rel5Page()),
          ],
        ),
      ),
    );
  }
}
