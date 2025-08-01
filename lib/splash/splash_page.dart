import 'package:crypto_tracker/splash/splash_thumbnail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/config/colors.dart';

import '../../../core/config/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: SplashThumbnail(
          onEnd: () {
            context.goNamed(Routes.mainLayer);
          },
        ),
      ),
    );
  }
}
