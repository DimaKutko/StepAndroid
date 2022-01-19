import 'dart:async';

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
      theme: ThemeData(primarySwatch: Colors.blue),
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
  int millisecond = 0;
  double leftPadding = 0;
  String textRunLine = 'Бегущая строка текста ';
  int r = 1, g = 1, b = 1, counter = 0, bestCounter = 0;
  Color? bgColor;
  bool enableBtn = true;

  Timer? timerAppBar;
  Timer? timerPadding;
  Timer? timerRunLine;
  Timer? timerBg;

  @override
  void initState() {
    super.initState();

    bgColor = Color.fromARGB(255, r, g, b);

    timerAppBar = Timer.periodic(const Duration(milliseconds: 1), (_) {
      setState(() => millisecond++);
    });

    timerPadding = Timer.periodic(const Duration(milliseconds: 10), (_) {
      setState(() => leftPadding += 0.01);
    });

    timerRunLine = Timer.periodic(const Duration(milliseconds: 150), (_) {
      setState(() => textRunLine = _runStr(textRunLine));
    });

    timerBg = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        if (r < 255) {
          r++;
        } else if (g < 255) {
          g++;
        } else if (b < 255) {
          b++;
        }

        bgColor = Color.fromARGB(255, r, g, b);
      });
    });
  }

  @override
  void dispose() {
    timerAppBar?.cancel();
    timerPadding?.cancel();
    timerRunLine?.cancel();
    timerBg?.cancel();

    super.dispose();
  }

  void _onPressedCounterBtn() {
    if (counter == 0) {
      Timer(const Duration(seconds: 5), () {
        setState(() {
          enableBtn = false;
          if (counter > bestCounter) bestCounter = counter;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Counter $counter, best counter $bestCounter"),
        ));

        Timer(const Duration(seconds: 2), () {
          setState(() {
            counter = 0;
            enableBtn = true;
          });
        });
      });

      setState(() {
        counter++;
      });
    } else {
      setState(() {
        counter++;
      });
    }
  }

  String _runStr(String str) {
    return str[str.length - 1] + str.substring(0, str.length - 1);
  }

  Widget _buildBtn() {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Ну я поехал'),
      ),
    );
  }

  Widget _buildTextRunLine() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Text(
          textRunLine,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildBtnCounter() {
    return Center(
      child: ElevatedButton(
        onPressed: enableBtn ? _onPressedCounterBtn : null,
        child: Text(counter == 0 ? 'Press me' : counter.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(title: Text('Millisecond $millisecond')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBtn(),
          _buildTextRunLine(),
          _buildBtnCounter(),
        ],
      ),
    );
  }
}
