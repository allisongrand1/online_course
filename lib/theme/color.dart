import 'package:flutter/material.dart';

Decoration background() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xffFFFFFF),
        Color.fromRGBO(255, 255, 255, 0),
      ],
    ),
  );
}

Decoration button() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF7E95), Color(0xFFFF1843)]));
}
