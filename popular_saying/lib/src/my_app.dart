import 'package:flutter/material.dart';
import 'package:popular_saying/src/ui/saying/saying_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SayingPage(),
    );
  }
}
