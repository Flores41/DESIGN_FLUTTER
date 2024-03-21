import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/zapato_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final zapatoProvider = Provider.of<ZapatoProvider>(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomAppBar(title: 'For You'),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [

                        Hero(
                          tag: 'zapato-1',
                          child: ZapatoSizePreview(
                            onTap: () =>
                                Navigator.pushNamed(context, '/descripcion'),
                            radius: 30,
                            color: const Color(0xffFFCF53),
                            image: zapatoProvider.assetImage,
                            fullScreen: false,
                          ),
                        ),
                        
                        const ZapatoDescription(
                          title: 'Nike Air Max 720',
                          description:
                              'The Nike Air Max 720 goes bigger than ever before with Nikes taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.',
                        ),
                        const SizedBox(
                          height: 150,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            child: BotonFlotante(
              title: 'Add to cart',
              sizeHeight: 0.06,
              sizeWidth: 0.35,
              color: 0xffEAA14E,
              price: 180,
              colors: Colors.grey.withOpacity(0.4),
              paddingHorizontal: 20,
            ),
          ),
        ],
      ),
    );
  }
}
