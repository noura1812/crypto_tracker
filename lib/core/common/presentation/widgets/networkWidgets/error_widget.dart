import 'package:crypto_tracker/core/config/colors.dart';
import 'package:crypto_tracker/core/config/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/network/error/failure.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.error,
    required this.refresh,
  });
  final Failure error;
  final Function refresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            error.message.toString(),
            textAlign: TextAlign.center,
            style: CustomTextStyle.styleW600S18White,
          ),
          SizedBox(height: 20.h),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: AppColors.accentColor, width: 1.w),
            ),
            onPressed: () {
              refresh();
            },
            child: Row(
              spacing: 10.w,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.refresh, color: AppColors.accentColor),
                Text('tryAgain', style: CustomTextStyle.styleW400S16white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
