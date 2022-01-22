import 'package:flutter/material.dart';

class Rel5Page extends StatelessWidget {
  const Rel5Page({Key? key}) : super(key: key);

  Widget _buildBlock(String title, Color color, {Color? textColor}) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(24),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor ?? Colors.white, fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rel 5')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _buildBlock('Top Content Here', Colors.blue),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBlock('1st', Colors.blue),
                _buildBlock('2nd', Colors.red, textColor: Colors.black),
                _buildBlock('3rd', Colors.blue),
              ],
            ),
            const Spacer(),
            _buildBlock('Bottmon Content Here', Colors.blue),
          ],
        ),
      ),
    );
  }
}
