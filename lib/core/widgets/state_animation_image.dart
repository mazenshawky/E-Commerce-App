import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/app_values.dart';

class StateAnimationImage extends StatelessWidget {
  final String animationImage;
  const StateAnimationImage({super.key, required this.animationImage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: AppSize.s200,
        width: AppSize.s200,
        child: Lottie.asset(animationImage),
      ),
    );
  }
}
