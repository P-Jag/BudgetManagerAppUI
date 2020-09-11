import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= 0.70) {
    return Theme.of(context).primaryColor;
  } else if (percent >= 0.50) {
    return Colors.yellow;
  } else if (percent >= 0.30) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
