import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sistem_analisis_teks_bencana/widget/colors.dart';

TextTheme createTextTheme(
    BuildContext context, String bodyFontString, String displayFontString) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme =
      GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}

Color switchColor(String color) {
  Color? result;
  switch (color) {
    case 'B-Bencana':
      result = appColorMap[AppColors.bBencana];
      break;
    case 'I-Bencana':
      result = appColorMap[AppColors.iBencana];
    case 'B-Lokasi':
      result = appColorMap[AppColors.bLokasi];
    case 'I-Lokasi':
      result = appColorMap[AppColors.iLokasi];
    case 'B-Waktu':
      result = appColorMap[AppColors.bWaktu];
    case 'I-Waktu':
      result = appColorMap[AppColors.iWaktu];
    case 'B-Dampak':
      result = appColorMap[AppColors.bDampak];
    case 'I-Dampak':
      result = appColorMap[AppColors.iDampak];
    default:
      result = appColorMap[AppColors.iDampak];
  }
  return result ?? Colors.white;
}
