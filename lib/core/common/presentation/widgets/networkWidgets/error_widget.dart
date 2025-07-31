import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/network/error/failure.dart';
import '../../../../extensions/style_extensions.dart';

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
            style: context.theme.textTheme.titleSmall!.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),
          FilledButton(
            onPressed: () {
              refresh();
            },
            child: Text(
              'tryAgain',
              style: context.theme.textTheme.titleSmall!.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
