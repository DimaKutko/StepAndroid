import 'package:flutter/material.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  Widget _buildBlock(Color color, String title) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black, width: 3),
      ),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab2')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(child: _buildBlock(Colors.blue, 'Lorem ipsum')),
                  Expanded(child: _buildBlock(Colors.greenAccent, 'SOMETHING')),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: _buildBlock(Colors.blueAccent, 'IPSUM DOLOR SIT AMET')),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    child: Column(children: [
                      Expanded(child: _buildBlock(Colors.pink, 'IPSUM YES')),
                      Expanded(child: _buildBlock(Colors.yellow, 'HELLOWORLD')),
                      Expanded(
                        flex: 3,
                        child:
                            _buildBlock(Colors.pink, 'LOREM IPSUM\nDOLOR SIT'),
                      )
                    ]),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _buildBlock(Colors.yellow, 'SOMETHING'),
                        ),
                        Expanded(
                          flex: 5,
                          child: _buildBlock(Colors.pink, 'YES YES YES'),
                        ),
                        Expanded(
                          flex: 2,
                          child: _buildBlock(Colors.yellow, 'DOLOR DOLOR'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
