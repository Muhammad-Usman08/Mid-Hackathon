import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final double value;
  final void Function()? onpressed;
  const MyButton(
      {super.key,
      required this.buttonText,
      this.onpressed,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 45,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xffAA14F0)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(value),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
