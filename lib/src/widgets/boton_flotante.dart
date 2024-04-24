import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:ui_01/src/widgets/widgets.dart';

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({
    super.key,
    required this.title,
    required this.sizeHeight,
    required this.sizeWidth,
    this.color,
    required this.price,
    this.colors,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
  });

  final String title;
  final double sizeHeight;
  final double sizeWidth;
  final int? color;
  final double price;
  final Color? colors;
  final double? paddingHorizontal;
  final double? paddingVertical;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.95,
      height: height * 0.1,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: paddingHorizontal!, vertical: paddingVertical!),
        child: Row(
          children: [
            BounceInRight(
              from: 8,
              child: Text(
                '\$$price',
                style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
            const Spacer(),
            BounceInLeft(
               from: 8,
              child: BotonNaranja(
                title: title,
                sizeHeight: sizeHeight,
                sizeWidth: sizeWidth,
                color: color!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
