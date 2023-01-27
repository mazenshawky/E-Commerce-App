import 'dart:async';

import 'package:e_commerce_app/core/utils/app_values.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/config/routes/app_routes.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/app/injection_container.dart' as di;

import '../../../../../app/app_prefs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;
  final AppPreferences _appPreferences = di.sl<AppPreferences>();

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _goNext() => _appPreferences.isUserLoggedIn().then(
        (isUserLoggedIn) => {
          if (isUserLoggedIn)
            {Navigator.pushReplacementNamed(context, Routes.homeRoute)}
          else
            {Navigator.pushReplacementNamed(context, Routes.loginRoute)}
        },
      );

  _startDelay() {
    _timer = Timer(const Duration(milliseconds: 2000), () => _goNext());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Icon(
        Icons.shopping_cart,
        color: AppColors.primary,
        size: AppSize.s80,
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
