import 'package:flutter/material.dart';

const _imgUrl =
    'https://pngimg.com/uploads/android_logo/android_logo_PNG12.png';

class Rel4Page extends StatelessWidget {
  const Rel4Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildSqare(Color color, double size, {double? padding}) {
      return Container(
        color: color,
        width: size,
        height: size,
        padding: EdgeInsets.all(padding ?? 0),
        child: Image.network(_imgUrl, fit: BoxFit.cover),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: const Text('Rel 4')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSqare(Colors.white, 50),
                _buildSqare(Colors.grey, 50),
                _buildSqare(Colors.blue, 50),
              ],
            ),
            Container(
              color: Colors.red,
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.all(8),
              child: Image.network(_imgUrl, fit: BoxFit.fitHeight),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSqare(Colors.yellow, 80, padding: 16),
                const SizedBox(width: 20),
                _buildSqare(Colors.green, 80, padding: 16),
                const SizedBox(width: 20),
                _buildSqare(Colors.greenAccent, 80, padding: 16),
              ],
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: _buildSqare(Colors.orange, 80, padding: 16),
                ),
                _buildSqare(Colors.brown, 140, padding: 40),
                _buildSqare(Colors.pink.shade200, 45),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
