import 'package:flutter/material.dart';

class Rel1Page extends StatelessWidget {
  const Rel1Page({Key? key}) : super(key: key);

  Widget _buildSquare(Color color, {double size = 30.0}) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      height: size,
      width: size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rel 1')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _buildSquare(Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildSquare(Colors.red),
              const Spacer(),
              _buildSquare(Colors.purple),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildSquare(Colors.blue),
              const SizedBox(width: 50),
              _buildSquare(Colors.red, size: 90),
              const SizedBox(width: 50),
              _buildSquare(Colors.green),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              _buildSquare(Colors.white),
              const Spacer(),
              _buildSquare(Colors.yellow),
              const Spacer(),
            ],
          ),
          _buildSquare(Colors.grey.shade300),
        ],
      ),
    );
  }
}
