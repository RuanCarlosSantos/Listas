import 'package:flutter/material.dart';
import 'package:dog_photo/src/ui/commons/app_colors.dart';
import 'package:dog_photo/src/ui/commons/app_text_style.dart';
import 'package:dog_photo/src/ui/commons/app_text.dart';

class AlertModalComponent extends StatelessWidget {
  final VoidCallback? _onpressedYesOption;

  const AlertModalComponent({
    required VoidCallback onpressedYesOption,
    Key? key,
  })  : _onpressedYesOption = onpressedYesOption,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 240,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                TextUtils.appBarTitle,
                style: AppTextStyle.alertTitleStyle,
              ),
              const Text(
                TextUtils.alertDescription,
                style: AppTextStyle.alertDescriptionStyle,
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      TextUtils.alertOptionNo,
                      style: AppTextStyle.alertOptionsStyle,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: _onpressedYesOption,
                    child: const Text(
                      TextUtils.alertOptionYes,
                      style: AppTextStyle.alertOptionsStyle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
