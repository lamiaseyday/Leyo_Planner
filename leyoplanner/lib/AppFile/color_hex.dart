import 'package:flutter/material.dart';

class FlutterColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", ""); //diyezi kaldırıyor.
    if (hexColor.length == 6) {
      hexColor = "FF" +
          hexColor; //6+2 den 8 karakterli yapıyor. bu ff renge bi etki etmiyor.
    }
    return int.parse(hexColor, radix: 16);
    //Radix'in belli bir aralıkta olması gerekir. Ayrıca string ile verilen sayının
    //Integer.MIN_VALU ve Interger.MAX_VALUE aralığında olması gerekir.
    //16 lık sayı sistemine çeviriyor galiba????
  }

  //consturctor method.
  FlutterColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
