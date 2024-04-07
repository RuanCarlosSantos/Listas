import 'package:flutter/material.dart';
import 'package:popular_saying/src/models/saying_model.dart';
import 'package:popular_saying/src/ui/commons/color_utils.dart';
import 'package:popular_saying/src/ui/commons/text_style_utils.dart';
import 'package:popular_saying/src/ui/commons/text_utils.dart';
import 'package:popular_saying/src/ui/saying/components/text_field_component.dart';

class SayingListItem extends StatelessWidget {
  final SayingModel? _saying;
  final TextEditingController? _controller;
  final bool? _isValid;
  final bool? _retry;
  final Function(bool, bool)? _updateState;

  const SayingListItem({
    required SayingModel? saying,
    required TextEditingController? controller,
    required bool? isValid,
    required bool? retry,
    required Function(bool, bool)? updateState,
    Key? key,
  })  : _saying = saying,
        _controller = controller,
        _isValid = isValid,
        _retry = retry,
        _updateState = updateState,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: ColorUtils.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _saying!.saying!,
              style: TextStyleUtils.sayingTextStyle,
            ),
            _retry!
                ? TextFieldComponent(
                    controller: _controller!,
                    onSubmitted: (value) async {
                      _checkAnswer(context, _controller, value);
                    },
                    onPressedIcon: () async {
                      String value = _controller.text;
                      _checkAnswer(context, _controller, value);
                    },
                  )
                : const SizedBox(),
            if (_controller!.text.isNotEmpty)
              Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: _isValid! ? ColorUtils.green : ColorUtils.red,
                  ),
                  Text(
                    _isValid ? Textutils.success : Textutils.retry,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _checkAnswer(
    BuildContext context,
    TextEditingController controller,
    String value,
  ) {
    FocusScope.of(context).unfocus();

    bool newIsValid = value == _saying!.response;
    bool newRetry = !newIsValid;

    _updateState!(newIsValid, newRetry);
  }
}
