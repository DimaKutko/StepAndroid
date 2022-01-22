import 'package:flutter/material.dart';

class Rel3Page extends StatelessWidget {
  const Rel3Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildBlock(String title, Color color, {double? width}) {
      return Container(
        color: color,
        width: width,
        padding: const EdgeInsets.all(24),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Rel 3')),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                _buildBlock('Top\n\nLeft', Colors.lightBlue),
                const Spacer(),
                _buildBlock('Top\n\nMiddle', Colors.deepOrange),
                const Spacer(),
                _buildBlock('Top\n\nRight', Colors.lightBlue),
              ],
            ),
            const Spacer(),
            _buildBlock('Center', Colors.lightBlue),
            Row(
              children: [
                _buildBlock('Left', Colors.deepOrange),
                const Spacer(),
                _buildBlock('Right', Colors.deepOrange),
              ],
            ),
            const Spacer(),
            _buildBlock(
              'Bottom of Screen',
              Colors.lightBlue,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
