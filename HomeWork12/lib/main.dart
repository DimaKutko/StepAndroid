import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:homework12/models/wallpaper_halper.dart';
import 'package:homework12/network/rest_client.dart';
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
  bool isLoading = false;
  WallpaperHelper? hallper;

  @override
  void initState() {
    super.initState();

    hallper = WallpaperHelper(client: RestClientImpl(client: http.Client()));
  }

  Future<void> getImage() async {
    setState(() => isLoading = true);
    await hallper?.getRandomWallpaper();
    setState(() => isLoading = false);
  }

  Future<void> setupWallpaper() async {
    setState(() => isLoading = true);
    await hallper?.setupWallpaper();
    setState(() => isLoading = false);
  }

  Widget _buildGenerateBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: getImage,
        child: const Text('Рандомные обои'),
      ),
    );
  }

  Widget _buildSetWallpaperBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: setupWallpaper,
        child: const Text('Установить эти обои'),
      ),
    );
  }

  Widget _buildImage() {
    final size = MediaQuery.of(context).size;

    return CachedNetworkImage(
      imageUrl: hallper!.imageUrl!,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator(color: Colors.black)),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
      height: size.height,
      width: size.width,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Work 12')),
      body: Stack(
        children: [
          if (hallper?.imageUrl != null) _buildImage(),
          Column(
            children: [
              const SizedBox(width: double.infinity),
              _buildGenerateBtn(),
              if (!isLoading && hallper?.imageUrl != null)
                _buildSetWallpaperBtn(),
            ],
          ),
          if (isLoading)
            const Center(child: CircularProgressIndicator(color: Colors.black)),
        ],
      ),
    );
  }
}
