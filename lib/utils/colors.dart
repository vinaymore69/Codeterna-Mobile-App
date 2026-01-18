import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF175CFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color cyan = Color(0xFF00DDFF);
  static const Color yellow = Color(0xFFFFC226);
  static const Color dark = Color(0xFF28282F);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF6B7280);

  // Gradient
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, cyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}