import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

class CustomColors {
  Color _activePrimaryButtom = Color.fromARGB(255, 63, 81, 181);
  Color _activeSecondaryButtom = Color.fromARGB(255, 230, 220, 255);
  Color _gradientMainColor = Colors.blue;
  Color _gradienteSecColor = Color.fromARGB(255, 212, 247, 255);
  Color _grandientePurpleColor = Color.fromARGB(266, 270, 270, 282);

  Color getActivePrimaryButtomColor() {
    return _activePrimaryButtom;
  }

  Color getActiveSecondaryButtomColor() {
    return _activeSecondaryButtom;
  }

  Color getActiveMainColor() {
    return _gradientMainColor;
  }

  Color getActiveSecColor() {
    return _gradienteSecColor;
  }

  Color getFundo() {
    return _grandientePurpleColor;
  }

  LinearGradient getCustomGradient() {
    return LinearGradient(
      colors: [Colors.purple[800], Colors.purple[900]],
      begin: const FractionalOffset(0.0, 0.1),
      end: const FractionalOffset(0.9, 0.0),
      stops: [0.0, 0.7],
      tileMode: TileMode.clamp,
    );
  }
}
