import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const _btnColor = Color.fromARGB(255, 51, 51, 51);

enum Operation {
  inversion,
  percent,
  division,
  multiplication,
  minus,
  plus,
  equals,
  clear,
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String value = '';

  void _onTap(String num) {
    setState(() {
      value += num;
    });
  }

  void _operation(Operation operation) {
    switch (operation) {
      case Operation.clear:
        setState(() => value = '');
        break;
      default:
    }
  }

  void _navigateBack() {
    Navigator.pop(context);
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 16),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
          value,
          softWrap: false,
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: _buildText()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _CalculatorButton(
                  title: 'AC',
                  onTap: _navigateBack,
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
                _CalculatorButton(
                  title: '+/-',
                  onTap: () => _operation(Operation.inversion),
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
                _CalculatorButton(
                  title: '%',
                  onTap: () => _operation(Operation.percent),
                  color: Colors.grey,
                  textColor: Colors.black,
                ),
                _CalculatorButton(
                  title: '÷',
                  onTap: () => _operation(Operation.plus),
                  color: Colors.orange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _CalculatorButton(
                  title: '7',
                  onTap: () => _onTap('7'),
                ),
                _CalculatorButton(
                  title: '8',
                  onTap: () => _onTap('8'),
                ),
                _CalculatorButton(
                  title: '9',
                  onTap: () => _onTap('9'),
                ),
                _CalculatorButton(
                  title: 'x',
                  onTap: () => _operation(Operation.division),
                  color: Colors.orange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _CalculatorButton(
                  title: '4',
                  onTap: () => _onTap('4'),
                ),
                _CalculatorButton(
                  title: '5',
                  onTap: () => _onTap('5'),
                ),
                _CalculatorButton(
                  title: '6',
                  onTap: () => _onTap('6'),
                ),
                _CalculatorButton(
                  title: '-',
                  onTap: () => _operation(Operation.minus),
                  color: Colors.orange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _CalculatorButton(
                  title: '1',
                  onTap: () => _onTap('1'),
                ),
                _CalculatorButton(
                  title: '2',
                  onTap: () => _onTap('2'),
                ),
                _CalculatorButton(
                  title: '3',
                  onTap: () => _onTap('3'),
                ),
                _CalculatorButton(
                  title: '+',
                  onTap: () => _operation(Operation.plus),
                  color: Colors.orange,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                _CalculatorButton(
                  title: '0',
                  onTap: () => _onTap('0'),
                  flex: 2,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 30),
                ),
                _CalculatorButton(
                  title: ',',
                  onTap: () => _onTap(','),
                ),
                _CalculatorButton(
                  title: '=',
                  onTap: () => _operation(Operation.equals),
                  color: Colors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CalculatorButton extends StatelessWidget {
  final int flex;
  final Color color;
  final Color textColor;
  final String title;
  final VoidCallback onTap;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;

  final size = 80.0;

  const _CalculatorButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.flex = 1,
    this.color = _btnColor,
    this.textColor = Colors.white,
    this.alignment = Alignment.center,
    this.padding = const EdgeInsets.all(0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(size / 2),
            child: Container(
              height: size,
              width: size,
              padding: padding,
              alignment: alignment,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(size / 2),
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
