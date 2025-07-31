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
  bool _animationDone = false;

  @override
  Widget build(BuildContext context) {
    if (_animationDone) {
      context.goNamed(Routes.mainLayer);
    }
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Center(
        child: SplashThumbnail(
          onEnd: () {
            setState(() {
              _animationDone = true;
            });
          },
        ),
      ),
    );
  }
}
