import 'package:flutter/material.dart';
import 'package:dog_photo/src/ui/commons/app_colors.dart';
import 'package:dog_photo/src/ui/commons/app_text.dart';

class Button extends StatelessWidget {
  final void Function()? _onPressed;

  const Button({
    required Function()? onPressed,
    Key? key,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.greenForestDeep,
      ),
      onPressed: _onPressed,
      child: Container(
        height: 40,
        constraints: const BoxConstraints(
          maxWidth: 100,
        ),
        child: const Center(
          child: Text(
            TextUtils.moreOneDog,
          ),
        ),
      ),
    );
  }
}
