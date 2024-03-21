import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_01/src/provider/zapato_provider.dart';
import 'package:ui_01/src/widgets/widgets.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final zapatoProvider = Provider.of<ZapatoProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
                child: Hero(
                  tag: 'zapato-1',
                  child: ZapatoSizePreview(
                    radius: 30,
                    color: const Color(0xffFFCF53),
                    image: zapatoProvider.assetImage,
                    fullScreen: true,
                    
                  ),
                ),
              ),
              Positioned(
                  top: 40,
                  left: 20,
                  child: FloatingActionButton.small(
                    elevation: 0,
                    highlightElevation: 0,
                    backgroundColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 35,
                    ),
                  ))
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const ZapatoDescription(
                      title: 'Nike Air Max 720',
                      description:
                          'The Nike Air Max 720 goes bigger than ever before with Nikes taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
                    ),
                    const BotonFlotante(
                      title: 'Buy Now',
                      sizeHeight: 0.05,
                      sizeWidth: 0.32,
                      price: 180,
                      color: 0xffEAA14E,
                    ),
                    const ColorsCircles(),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    const IconsNavegacion()
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorsCircles extends StatelessWidget {
  const ColorsCircles({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: const Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 60,
                    child: CustomCircleColor(
                      colors: (0xffC6D642),
                      radius: 15,
                      index: 3,
                      assets: 'assets/img/verde.png',
                    )),
                Positioned(
                    left: 40,
                    child: CustomCircleColor(
                      colors: (0xffFFAD29),
                      radius: 15,
                      index: 3,
                      assets: 'assets/img/amarillo.png',
                    )),
                Positioned(
                    left: 20,
                    child: CustomCircleColor(
                      colors: (0xff2099F1),
                      radius: 15,
                      index: 2,
                      assets: 'assets/img/azul.png',
                    )),
                CustomCircleColor(
                  colors: (0xff364D56),
                  radius: 15,
                  index: 1,
                  assets: 'assets/img/negro.png',
                ),
              ],
            ),
          ),
          BotonNaranja(
            title: 'More Related Items',
            sizeHeight: 0.04,
            sizeWidth: 0.52,
            color: 0xffFFC675,
          )
        ],
      ),
    );
  }
}

class CustomCircleColor extends StatelessWidget {
  const CustomCircleColor({
    super.key,
    this.colors = 0x00EAA14E,
    this.radius = 0,
    this.index = 0,
    this.assets = '',
  });

  final int? colors;
  final double? radius;
  final int? index;
  final String? assets;
  @override
  Widget build(BuildContext context) {
    final zapatoProvider = Provider.of<ZapatoProvider>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: () {
        zapatoProvider.setAssetImage = assets!;
      },
      child: FadeInLeft(
        delay: Duration(milliseconds: index! * 100),
        duration: const Duration(milliseconds: 300),
        child: CircleAvatar(
          backgroundColor: Color(colors!),
          radius: radius,
        ),
      ),
    );
  }
}

class IconsCustom extends StatelessWidget {
  const IconsCustom({
    super.key,
    this.colors = Colors.transparent,
    this.icon = Icons.abc_outlined,
    this.size = 0,
    this.sizeWidth = 0,
    this.sizeHeight = 0,
    this.colorContainer = Colors.transparent,
  });

  final Color? colors;
  final IconData? icon;
  final double? size;
  final double? sizeWidth;
  final double? sizeHeight;
  final Color? colorContainer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
      width: sizeWidth,
      height: sizeHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorContainer!,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: -5,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          icon,
          color: colors,
          size: size,
        ),
      ),
    );
  }
}

class IconsNavegacion extends StatelessWidget {
  const IconsNavegacion({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconsCustom(
          colors: Colors.red,
          icon: Icons.favorite,
          size: 26,
          sizeWidth: width * 0.13,
          sizeHeight: height * 0.13,
          colorContainer: Colors.white,
        ),
        IconsCustom(
          colors: Colors.grey.withOpacity(0.6),
          icon: Icons.shopify_outlined,
          size: 26,
          sizeWidth: width * 0.13,
          sizeHeight: height * 0.13,
          colorContainer: Colors.white,
        ),
        IconsCustom(
          colors: Colors.grey.withOpacity(0.6),
          icon: Icons.settings,
          size: 26,
          sizeWidth: width * 0.13,
          sizeHeight: height * 0.13,
          colorContainer: Colors.white,
        ),
      ],
    );
  }
}
