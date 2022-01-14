import 'dart:math';

import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _date;
  Color _color = Colors.black;

  Color get _randomColor =>
      Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

  void _onPressedTextBtn() {
    final _lessonDate = DateTime(2022, 1, 14, 18);

    final duration = _lessonDate.difference(DateTime.now());

    setState(() {
      _color = _randomColor;
      _date =
          '${duration.inDays} дней, ${duration.inHours.remainder(60)}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: _color, title: Text(widget.title)),
        body: Center(
          child: ElevatedButton(
            style: TextButton.styleFrom(backgroundColor: _color),
            onPressed: _onPressedTextBtn,
            child: Text(_date ?? 'Press me'),
          ),
        ));
  }
}
