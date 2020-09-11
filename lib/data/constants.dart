import 'package:flutter/material.dart';

const kPrimaryTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
  letterSpacing: 1.2,
);

const kSecondaryTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
);

final kMainBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      offset: Offset(0, 2),
      blurRadius: 6.0,
    ),
  ],
  borderRadius: BorderRadius.circular(10.0),
);
