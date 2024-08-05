import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Color? color;
  final EdgeInsetsGeometry? margin;
  const CustomContainer({super.key, this.color, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      margin: margin,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }
}
