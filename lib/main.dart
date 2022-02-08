import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Fatal signal 11 (SIGSEGV) Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Bar Title'),
        ),
        body: const Text('Body Content'),
        floatingActionButton: const Button(
          child: Text('Blur Container Child'),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        color: Colors.white.withOpacity(0.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaY: 30,
            sigmaX: 30,
          ),
          child: child,
        ),
      ),
    );
  }
}
