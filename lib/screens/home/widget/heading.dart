import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  const Heading({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
    );
  }
}
