import 'package:flutter/material.dart';

class LoginField extends StatelessWidget {
  final String title;
  final String fieldName;
  const LoginField({super.key, required this.title, required this.fieldName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: TextField(
            decoration: InputDecoration(
              hintText: fieldName,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Color(
                      0xff8e8e8e), // Set your desired border color when focused here
                ),
              ),
              contentPadding: const EdgeInsets.all(17.0),
            ),
          ),
        )
      ],
    );
  }
}
