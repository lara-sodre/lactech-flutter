import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();


  static const Color azulEscuro = Color(0xFF1A3A6B);
  static const Color azulMedio = Color(0xFF1E6BB8);
  static const Color azulClaro = Color(0xFF4FC3F7);
  static const Color azulFundo = Color(0xFFE8F4FD);

  static const Color amarelo = Color(0xFFF5A623);

  static const Color verde = Color(0xFF2E7D32);
  static const Color verdeClaro = Color(0xFFE8F5E9);

  static const Color vermelho = Color(0xFFC62828);

  static const Color cinzaClaro = Color(0xFFF5F7FA);
  static const Color cinzaTexto = Color(0xFF6B7280);

  static const Color branco = Color(0xFFFFFFFF);


  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: cinzaClaro,


      colorScheme: ColorScheme.fromSeed(
        seedColor: azulEscuro,
        brightness: Brightness.light,
      ).copyWith(
        primary: azulEscuro,
        onPrimary: branco,
        secondary: azulMedio,
        onSecondary: branco,
        error: vermelho,
        onError: branco,
        surface: branco,
        onSurface: azulEscuro,
      ),


      appBarTheme: const AppBarTheme(
        backgroundColor: azulEscuro,
        foregroundColor: branco,
        elevation: 0,
        centerTitle: false,
      ),


      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: azulEscuro,
          foregroundColor: branco,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),


      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: branco,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD1D5DB),
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Color(0xFFD1D5DB),
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: azulMedio,
            width: 2,
          ),
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),


      cardTheme: CardThemeData(
        color: branco,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),


      drawerTheme: const DrawerThemeData(
        backgroundColor: azulEscuro,
      ),
    );
  }
}
