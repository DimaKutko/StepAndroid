import 'package:flutter/material.dart';

class Tab4Page extends StatelessWidget {
  const Tab4Page({Key? key}) : super(key: key);

  Widget _buildBlock(bool lightGrey) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: lightGrey ? Colors.grey : Colors.black87,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: lightGrey ? Colors.grey : Colors.black54,
            border: Border.all(color: Colors.white, width: 5),
            borderRadius: const BorderRadius.all(Radius.circular(1000)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tab4')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(child: _buildBlock(false)),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: _buildBlock(true),
                              ),
                              Expanded(
                                child: _buildBlock(false),
                              ),
                            ],
                          ),
                        ),
                        Expanded(child: _buildBlock(true)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Expanded(
                        child: _buildBlock(true),
                      ),
                      Expanded(
                        child: _buildBlock(false),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: _buildBlock(true)),
                        Expanded(child: _buildBlock(false)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: _buildBlock(false)),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(child: _buildBlock(true)),
                              Expanded(child: _buildBlock(false)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: _buildBlock(true)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
