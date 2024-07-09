import 'dart:ui';

enum AppColors {
  bBencana,
  iBencana,
  bLokasi,
  iLokasi,
  bWaktu,
  iWaktu,
  bDampak,
  iDampak,
}

Map<AppColors, Color> appColorMap = {
  AppColors.bBencana: const Color(0xFF11325F),
  AppColors.iBencana: const Color(0xFF716DE8),
  AppColors.bLokasi: const Color(0xFF4AA3DF),
  AppColors.iLokasi: const Color.fromARGB(255, 152, 146, 55),
  AppColors.bWaktu: const Color.fromARGB(255, 94, 11, 6),
  AppColors.iWaktu: const Color.fromARGB(255, 190, 37, 180),
  AppColors.bDampak: const Color.fromARGB(255, 29, 203, 116),
  AppColors.iDampak: const Color.fromARGB(255, 89, 35, 48),
};
