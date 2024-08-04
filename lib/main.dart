import 'package:flutter/material.dart';
import 'package:myapp/screens/home/home.dart';
import 'package:myapp/screens/home/home_view.dart';
// import 'package:myapp/screens/home/home_view.dart';
// import 'package:myapp/screens/product/product_detail.dart';
// import 'package:myapp/screens/product/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
