import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/zapato_provider.dart';

class ZapatoSizePreview extends StatelessWidget {
  const ZapatoSizePreview({
    super.key,
    required this.radius,
    required this.color,
    required this.image,
    this.fullScreen = false,
    this.onTap,
  });

  final Color color;
  final double radius;
  final String image;
  final bool? fullScreen;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        onTap: onTap,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final maxWidth = constraints.maxWidth;
            final maxHeight = constraints.maxHeight;

            return Container(
              constraints: BoxConstraints(
                maxWidth: maxWidth,
                maxHeight: maxHeight * 0.60,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(radius),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ZapatoCustom(image: image),
                  fullScreen! ? const SizedBox() : const Zapatostallas(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class Zapatostallas extends StatelessWidget {
  const Zapatostallas({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TallaZapato(7.0),
          TallaZapato(7.5),
          TallaZapato(8.0),
          TallaZapato(8.5),
          TallaZapato(9.0),
          TallaZapato(9.5),
        ],
      ),
    );
  }
}

class TallaZapato extends StatelessWidget {
  const TallaZapato(
    this.talla, {
    super.key,
  });

  final double talla;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final zapatoProvider = Provider.of<ZapatoProvider>(context);
    return InkWell(
      onTap: () {
        zapatoProvider.setTalla = talla;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        constraints: BoxConstraints(
          maxWidth: width * 0.11,
          maxHeight: height * 0.053,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: talla == zapatoProvider.talla
              ? const Color(0xffF1A23A)
              : Colors.white,
          boxShadow: zapatoProvider.talla == talla
              ? const [
                  BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  )
                ]
              : const [],
        ),
        child: Center(
          child: Text(
            talla.toString().replaceAll('.0', ''),
            style: TextStyle(
              color: zapatoProvider.talla == talla
                  ? Colors.white
                  : const Color(0xffF1A23A),
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}

class ZapatoCustom extends StatelessWidget {
  const ZapatoCustom({
    super.key,
    required this.image,
  });

  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          const ZapatoSombra(),
          BounceInLeft(
            delay: const Duration(milliseconds: 300),
            child: Image(
              image: AssetImage(image),
            ),
          ),
        ],
      ),
    );
  }
}

class ZapatoSombra extends StatelessWidget {
  const ZapatoSombra({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      bottom: 20,
      right: 0,
      child: Transform.rotate(
        angle: -0.5,
        child: Container(
          height: height * 0.16,
          width: width * 0.53,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Color(0xffEAA14E),
                blurRadius: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
