import 'package:city/src/ui/commons/app_text_style.dart';
import 'package:flutter/material.dart';

class RichTextComponent extends StatelessWidget {
  final String? _title;
  final String? _description;

  const RichTextComponent({
    required String? title,
    required String? description,
    Key? key,
  })  : _title = title,
        _description = description,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: AppTextStyle.titleDetailStyle,
        children: [
          TextSpan(
            text: _title,
          ),
          TextSpan(
            text: _description,
            style: AppTextStyle.descriptionDetailStyle,
          ),
        ],
      ),
    );
  }
}
