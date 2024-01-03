import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

const _regular = FontWeight.w400;
const _medium = FontWeight.w500;
const _semiBold = FontWeight.w600;
const _bold = FontWeight.w700;

TextTheme textTheme({Color color = const Color(0xFF000000)}) => TextTheme(
      displayLarge: GoogleFonts.montserrat(
        fontSize: 29.sp,
        fontWeight: _bold,
        color: color,
        textBaseline: TextBaseline.alphabetic,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 25.0.sp,
        fontWeight: _semiBold,
        color: color,
        textBaseline: TextBaseline.alphabetic,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 16.0.sp,
        fontWeight: _bold,
        color: color,
        textBaseline: TextBaseline.alphabetic,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 14.0.sp,
        fontWeight: _medium,
        color: color,
        textBaseline: TextBaseline.alphabetic,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14.0.sp,
        fontWeight: _regular,
        color: color,
        textBaseline: TextBaseline.alphabetic,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 12.0.sp,
        fontWeight: _regular,
        color: color,
        textBaseline: TextBaseline.alphabetic,
      ),
    );
