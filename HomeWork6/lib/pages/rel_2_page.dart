import 'package:flutter/material.dart';

class Rel2Page extends StatelessWidget {
  const Rel2Page({Key? key}) : super(key: key);

  Widget _buildColor(String title, Color color) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(16),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(color: Colors.black, fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Rel 2')),
      body: Padding(
        padding: const EdgeInsets.only(left: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildColor('red', Colors.red),
            _buildColor('orange', Colors.orange),
            _buildColor('yellow', Colors.yellow),
            _buildColor('green', Colors.green),
            _buildColor('blue', Colors.blue),
            _buildColor('indigo', Colors.indigo),
            _buildColor('violet', Colors.purple.shade300),
          ],
        ),
      ),
    );
  }
}
