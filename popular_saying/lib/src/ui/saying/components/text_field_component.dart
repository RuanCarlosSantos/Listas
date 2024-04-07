import 'package:flutter/material.dart';
import 'package:popular_saying/src/ui/commons/color_utils.dart';

class TextFieldComponent extends StatelessWidget {
  final TextEditingController? _controller;
  final Function(String)? _onSubmitted;
  final VoidCallback? _onPressedIcon;

  const TextFieldComponent({
    required TextEditingController? controller,
    required Function(String)? onSubmitted,
    required VoidCallback? onPressedIcon,
    Key? key,
  })  : _controller = controller,
        _onSubmitted = onSubmitted,
        _onPressedIcon = onPressedIcon,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextField(
        controller: _controller,
        onSubmitted: _onSubmitted,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          suffixIcon: IconButton(
            onPressed: _onPressedIcon,
            icon: const Icon(
              Icons.send,
              color: ColorUtils.black,
            ),
          ),
        ),
      ),
    );
  }
}
