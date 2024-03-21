import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_01/src/pages/page.dart';
import 'package:ui_01/src/provider/zapato_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => ZapatoProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (BuildContext context) => const HomeScreen(),
        '/descripcion': (BuildContext context) => const ZapatoDescPage(),

      }
    );
  }
}
