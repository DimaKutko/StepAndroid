import 'package:flutter/material.dart';
import 'package:homework7/pages/calculator_page.dart';
import 'package:homework7/pages/tab2_page.dart';
import 'package:homework7/pages/tab4_page.dart';

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
      appBar: AppBar(title: const Text('Home work 7')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildPageBtn('CalculatorPage', const CalculatorPage()),
            _buildPageBtn('Tab2', const Tab2Page()),
            _buildPageBtn('Tab4', const Tab4Page()),
          ],
        ),
      ),
    );
  }
}
