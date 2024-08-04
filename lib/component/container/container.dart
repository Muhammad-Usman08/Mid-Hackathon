import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          height: 150,
          decoration: BoxDecoration(
              color: const Color(0xffAA14F0),
              borderRadius: BorderRadius.circular(15)),
        ),
        const Positioned(
          top: 30,
          left: 20,
          child: Text(
            'Nike Air Max 270',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),
        const Positioned(
          top: 55,
          left: 20,
          child: Text(
            'Mens Shoes',
            style: TextStyle(
                color: Color(0xff9CA0AF),
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
        ),
        const Positioned(
          bottom: 30,
          left: 20,
          child: Text(
            'Rs.290.00',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        Positioned(
          right: 10,
          top: 15,
          child: Transform.rotate(
            angle: -0.76427968,
            child: Image.asset(
              'assets/products/shoes.png',
              width: 220,
            ),
          ),
        ),
      ],
    );
  }
}
