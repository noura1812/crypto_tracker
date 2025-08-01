import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/config/colors.dart';
import '../../core/config/text_styles.dart';

class Themes {
  static const fontFamily = 'Montserrat';

  static ThemeData getLightTheme() => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black,
    primaryColor: AppColors.black,

    colorScheme: ColorScheme.dark(
      primary: AppColors.black,
      onPrimary: Colors.white,
    ),

    dividerTheme: const DividerThemeData(color: Colors.white),

    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 60.h,
      titleTextStyle: CustomTextStyle.styleW600S24white.copyWith(
        fontSize: 20.sp,
        color: Colors.white,
      ),
      centerTitle: true,
      elevation: 0.h,
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white, size: 24.h),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColors.black,
      selectedIconTheme: IconThemeData(
        size: 25.r,
        color: AppColors.accentColor,
      ),
      unselectedIconTheme: IconThemeData(size: 25.r, color: Colors.grey),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedLabelStyle: CustomTextStyle.styleW400S16white.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.accentColor,
      ),
      unselectedLabelStyle: CustomTextStyle.styleW400S16white.copyWith(
        fontSize: 10.sp,
        fontWeight: FontWeight.w500,
        color: Colors.grey,
      ),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: Colors.grey,
    ),
  );
}
