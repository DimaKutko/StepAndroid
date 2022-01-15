import 'dart:io';
import 'dart:math';

import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Home Work 3'),
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
  late int maxCount;

  double btnWidth = 100.0;
  int count = 0;
  String? message;
  String? countryCode;

  @override
  void initState() {
    super.initState();

    maxCount = next(10, 20);
  }

  int next(int min, int max) {
    final _random = Random();

    return min + _random.nextInt(max - min);
  }

  Widget _resizebleBtn() {
    void onPressed() {
      setState(() => btnWidth += 5);
    }

    return Center(
      child: SizedBox(
        width: btnWidth,
        child: ElevatedButton(
          child: const Text('Больше'),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget _brokenBtn() {
    void onPressed() {
      if (count < maxCount) {
        setState(() => count++);
      } else {
        setState(() {
          message = 'Ну все сломал (';
        });
      }
    }

    return Center(
      child: ElevatedButton(
        child: Text(message ?? count.toString()),
        onPressed: message != null ? null : onPressed,
      ),
    );
  }

  Widget _buildFlagBtn() {
    void onPressed() {
      setState(() {
        countryCode = Platform.localeName.split('_').last;
      });
    }

    return Center(
      child: ElevatedButton(
        child: countryCode == null
            ? const Text('Флаг')
            : Flag.fromString(
                countryCode!,
                height: 30,
                width: 40,
                fit: BoxFit.fill,
              ),
        onPressed: onPressed,
      ),
    );
  }

  Widget _buildResetBtn() {
    void onPressed() {
      setState(() {
        countryCode = null;
        message = null;
        count = 0;
        btnWidth = 100.0;
      });
    }

    return Center(
      child: ElevatedButton(
        child: const Text('Сброс'),
        onPressed: onPressed,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          _resizebleBtn(),
          const Spacer(),
          _brokenBtn(),
          const Spacer(),
          _buildFlagBtn(),
          const Spacer(),
          _buildResetBtn(),
          const Spacer(),
        ],
      ),
    );
  }
}
