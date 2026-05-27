import 'package:calculadora/calculadora_pantalla.dart';
import 'package:flutter/material.dart';


Widget fuentePantalla(double size, String num, Color color){
  return Text("$num", style: TextStyle(
                color: color,
                fontSize: size,
                fontFamily: "HGMaruGothicMPRO",
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.end
                );
}

Widget fuenteNormal(double size, String dato, Color color){
  return Text(dato, style: TextStyle(
                color: color,
                fontSize: size,
                fontFamily: "Aptos (Body)",
                fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
                );
}
