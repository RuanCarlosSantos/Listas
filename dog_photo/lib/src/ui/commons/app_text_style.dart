import 'package:flutter/material.dart';
import 'package:dog_photo/src/ui/commons/app_colors.dart';

class AppTextStyle {
  static const TextStyle appBarStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle alertTitleStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 24,
  );

  static const TextStyle alertDescriptionStyle = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle alertOptionsStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  );

  static const TextStyle noDogsStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle galleryStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );
}
