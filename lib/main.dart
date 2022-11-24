import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'shake for a surprise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = ['images/1.jpg', 'images/2.jpg', 'images/3.jpg', 'images/4.jpg'];
  Random r = Random();
  int index = 0;

  @override
  void initState() {
    super.initState();

    ShakeDetector d = ShakeDetector.autoStart(onPhoneShake: () {
      setState(() {
        index = r.nextInt(images.length);
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        child: Image(
          image: AssetImage(images[index]),
          alignment: Alignment.center,
        ),
        onTap: () {
          setState(() {
            index = r.nextInt(images.length);
          });
        }
      ),
    );
  }
}
