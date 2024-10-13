import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/gen/colors.gen.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConstants {
  static TextStyle titleLargeBoldPrimaryInter = GoogleFonts.inter(
    color: ColorName.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle titleLargeBoldBlackInter = GoogleFonts.inter(
    color: ColorName.fontBlack,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle titleLargeBoldWhiteInter = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static TextStyle titleMediumPrimaryInter = GoogleFonts.inter(
    color: ColorName.primaryColor,
    fontSize: 18,
  );

  static TextStyle titleMediumBlackInter = GoogleFonts.inter(
    color: ColorName.fontBlack,
    fontSize: 18,
  );

  static TextStyle titleSmallBoldWhiteInter = GoogleFonts.inter(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  static TextStyle titleSmallWhiteInter = GoogleFonts.inter(
    color: Colors.white,
    fontSize: 16,
  );
}
