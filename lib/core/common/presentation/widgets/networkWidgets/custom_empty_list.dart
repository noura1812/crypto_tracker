import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../extensions/style_extensions.dart';
import 'package:lottie/lottie.dart';
import 'package:crypto_tracker/core/config/assets.dart';

class CustomEmptyList extends StatelessWidget {
  const CustomEmptyList({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.h,
        children: [
          Lottie.asset(
            AppAssets.emptyBox,
            height: 150.r,
            width: 150.r,
            fit: BoxFit.fill,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.titleSmall!.copyWith(
              fontSize: 18.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
