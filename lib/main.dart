import 'package:flutter/material.dart';
import 'package:loader_animation/animation/animation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: const FlutterLogo(
              size: 1000,
            ),
          ),
          IgnorePointer(
            child: AnimationScreen(
              color: Theme.of(context).colorScheme.secondary,
              // color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
