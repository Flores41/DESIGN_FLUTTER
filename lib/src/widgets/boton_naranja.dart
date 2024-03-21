import 'package:flutter/material.dart';

class BotonNaranja extends StatelessWidget {
  const BotonNaranja({
    super.key,
    required this.title,
    required this.sizeHeight,
    required this.sizeWidth,
    required this.color,
  });

  final String title;
  final double sizeHeight;
  final double sizeWidth;
  final int color;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight * height,
      width: sizeWidth * width,
      decoration: BoxDecoration(
        color: Color(color),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          title,
          style:
              const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
