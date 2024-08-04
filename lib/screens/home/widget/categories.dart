import 'package:flutter/material.dart';

class CategoriesOptions extends StatelessWidget {
  final Color? color;
  final String name;
  final Color? bgcolor;
  const CategoriesOptions(
      {super.key, required this.name, this.color, this.bgcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: bgcolor),
        ),
      ),
    );
  }
}
