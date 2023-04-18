import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static TextTheme lightTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
          color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 30),
      titleSmall: GoogleFonts.poppins(
          color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w300),
      titleMedium: GoogleFonts.poppins(
          color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
      titleLarge: GoogleFonts.poppins(
          color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold));

  static TextTheme darkTextTheme = TextTheme(
      displayMedium: GoogleFonts.montserrat(
          color: Colors.white70, fontWeight: FontWeight.w600, fontSize: 30),
      titleSmall: GoogleFonts.poppins(
          color: Colors.white60, fontSize: 20, fontWeight: FontWeight.w300),
      titleMedium: GoogleFonts.poppins(
          color: Colors.white60, fontSize: 15, fontWeight: FontWeight.w300),
      titleLarge: GoogleFonts.poppins(
          color: Colors.white60, fontSize: 18, fontWeight: FontWeight.bold));
}
