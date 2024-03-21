import 'package:flutter/material.dart';

class ZapatoProvider with ChangeNotifier {
  String _assetImage = 'assets/img/azul.png';
  double _talla = 9.0;



  String get assetImage => _assetImage;
  double get talla => _talla;

  set setAssetImage(String valor) {
    _assetImage = valor;
    notifyListeners();
  }

  set setTalla(double valor) {
    _talla = valor;
    notifyListeners();
  }
}
