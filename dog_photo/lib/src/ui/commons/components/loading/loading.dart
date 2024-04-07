import 'package:dog_photo/src/ui/commons/app_colors.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(72.0),
      child: CircularProgressIndicator(
        color: AppColors.white,
      ),
    );
  }
}
