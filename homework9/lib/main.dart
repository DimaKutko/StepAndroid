import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homework9/network/rest_client.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  RestClient? _client;
  double _value = 0;
  List<dynamic> images = [];

  int get _count => (_value * 30).toInt();

  @override
  void initState() {
    super.initState();

    _client = RestClientImpl(client: http.Client());
  }

  Future<void> getImages() async {
    if (_count == 0) return;

    try {
      var endpoint = 'https://api.unsplash.com/photos/random';
      endpoint += '?client_id=oim-16Ie_nspeGwp9jmuPjc27KtsR61z36hvRUA7mU4';
      endpoint += '&count=$_count';

      final result = await _client?.get(endpoint);

      setState(() {
        images = result?.list ?? [];
      });
    } catch (e) {
      print(e);
    }
  }

  void onChangedSlide(double value) {
    setState(() {
      _value = value;
    });
  }

  Widget _buildSlider() {
    return Slider(
      value: _value,
      onChanged: onChangedSlide,
    );
  }

  Widget _buildGenerateBtn() {
    return ElevatedButton(
      onPressed: getImages,
      child: Text('Получить $_count рандомных фоток'),
    );
  }

  Widget _buildImage(int index) {
    final String url = images[index]['urls']['small'];

    return AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) =>
            const CircularProgressIndicator(color: Colors.black),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildGrid() {
    Widget grid() {
      return GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(8),
        children: List.generate(
          images.length,
          (index) => _buildImage(index),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: images.isNotEmpty ? grid() : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Work 9')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          _buildSlider(),
          _buildGenerateBtn(),
          const SizedBox(height: 16),
          Expanded(child: _buildGrid()),
        ],
      ),
    );
  }
}
