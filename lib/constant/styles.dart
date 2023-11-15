import 'package:auth_test_app/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  AppStyles._();

  static TextStyle textStyleAppBar() => const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  static TextStyle styleTextBody14({Color? colorText, double? size = 14, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.inter(
        color: colorText ?? AppColors.black,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody12({Color? colorText, double? size = 12, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.inter(
        color: colorText ?? AppColors.black,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody16({Color? colorText, double? size = 16, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.inter(
        color: colorText ?? AppColors.black,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody18({Color? colorText, double? size = 18, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.black,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody20({Color? colorText, double? size = 20, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.black,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static TextStyle styleTextBody25({Color? colorText, double? size = 25, FontWeight? fontWeight, TextDecoration? decoration}) => GoogleFonts.poppins(
        color: colorText ?? AppColors.black,
        fontWeight: fontWeight,
        fontSize: size,
        decoration: decoration,
      );

  static InputDecoration inputDecorationFloating(String hint, {Widget? suffixIcon, bool? disableLabel}) => InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        floatingLabelStyle: AppStyles.styleTextBody20(colorText: AppColors.bg, fontWeight: FontWeight.bold),
        hintStyle: AppStyles.styleTextBody14(colorText: AppColors.grayMedium),
        contentPadding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.bg,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            color: AppColors.lightGrey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      );
}
