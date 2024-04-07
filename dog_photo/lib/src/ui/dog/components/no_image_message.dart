import 'package:flutter/material.dart';
import 'package:dog_photo/src/ui/commons/app_text_style.dart';
import 'package:dog_photo/src/ui/commons/app_text.dart';

class NoImageMessage extends StatelessWidget {
  const NoImageMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      TextUtils.noDogs,
      style: AppTextStyle.noDogsStyle,
    );
  }
}
