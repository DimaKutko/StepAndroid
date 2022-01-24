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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int row = 0;
  int column = 0;
  TextEditingController? _controllerRow;
  TextEditingController? _controllerColumn;
  List<int> closed = [];

  bool get isShowGrid => row != 0 && column != 0;

  @override
  initState() {
    super.initState();
    _controllerRow = TextEditingController();
    _controllerColumn = TextEditingController();
  }

  @override
  dispose() {
    _controllerRow?.dispose();
    _controllerColumn?.dispose();

    super.dispose();
  }

  void _onTapReset() {
    _controllerRow?.clear();
    _controllerColumn?.clear();

    setState(() {
      row = 0;
      column = 0;
      closed = [];
    });
  }

  void _onTapGridBtn(int index) {
    final _row = index ~/ row;
    final _column = index - _row * row;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Нажата кнопка $_row x $_column')),
    );

    setState(() => closed.add(index));
  }

  void _onTappedCreate() {
    try {
      final _row = int.tryParse(_controllerRow?.text ?? '');
      final _column = int.tryParse(_controllerColumn?.text ?? '');

      FocusScope.of(context).unfocus();

      if (_row == null || _column == null) {
        throw Exception('Заполните все поля');
      } else if (_row == 0 || _column == 0) {
        throw Exception('Row и Column не могут быть равны нулю');
      } else {
        setState(() {
          row = _row;
          column = _column;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  Widget _buidlTextField(String title, TextEditingController? controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title),
          Expanded(
            child: TextField(
              controller: controller,
              scrollPadding: const EdgeInsets.all(0),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGrid() {
    Widget grid() {
      return GridView.count(
        crossAxisCount: row,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(
          row * column,
          (index) => _buildItem(index),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.grey.shade300,
      ),
      child: isShowGrid ? grid() : null,
    );
  }

  Widget _buildItem(int index) {
    final _row = index ~/ row;
    final _column = index - _row * row;
    final isActive = !closed.contains(index);

    return AspectRatio(
      aspectRatio: 1,
      child: InkWell(
        onTap: () => _onTapGridBtn(index),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? Colors.black54 : Colors.black12,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            '$_row x $_column',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Work 8')),
      body: Column(
        children: [
          _buidlTextField('Row: ', _controllerRow),
          _buidlTextField('Column: ', _controllerColumn),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onTappedCreate,
                    child: const Text('GENERATE'),
                  ),
                ),
                if (isShowGrid) ...[
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _onTapReset,
                      child: const Text('RESET'),
                    ),
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(child: _buildGrid()),
        ],
      ),
    );
  }
}
