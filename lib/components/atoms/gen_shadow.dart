import 'package:flutter/material.dart';

List<BoxShadow> customShadowDown = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.3),
    spreadRadius: 5,
    blurRadius: 10,
    offset: const Offset(0, 2), // changes position of shadow
  ),
];

List<BoxShadow> customShadowUp = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 5,
    blurRadius: 7,
    offset: const Offset(0, 2),
  ),
];
