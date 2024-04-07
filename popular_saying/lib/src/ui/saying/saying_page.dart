import 'package:flutter/material.dart';
import 'package:popular_saying/src/data/sayings.dart';
import 'package:popular_saying/src/models/saying_model.dart';
import 'package:popular_saying/src/ui/commons/color_utils.dart';
import 'package:popular_saying/src/ui/commons/text_utils.dart';
import 'package:popular_saying/src/ui/saying/components/saying_list_item.dart';

class SayingPage extends StatefulWidget {
  const SayingPage({super.key});

  @override
  State<SayingPage> createState() => _SayingPageState();
}

class _SayingPageState extends State<SayingPage> {
  late List<TextEditingController> _controllers;
  late List<bool> _isValidQuests;
  late List<bool> _retry;

  @override
  void initState() {
    _controllers = List.generate(
      sayings.length,
      (_) => TextEditingController(),
    );
    _isValidQuests = List.generate(
      sayings.length,
      (_) => false,
    );
    _retry = List.generate(
      sayings.length,
      (_) => true,
    );
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _updateState(int index, bool newIsValid, bool newRetry) {
    setState(() {
      _isValidQuests[index] = newIsValid;
      _retry[index] = newRetry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorUtils.purple300,
      appBar: AppBar(
        backgroundColor: ColorUtils.yellow,
        title: const Text(Textutils.appBarTitle),
      ),
      body: ListView.builder(
        itemCount: sayings.length,
        itemBuilder: (context, index) {
          SayingModel saying = sayings[index];
          TextEditingController controller = _controllers[index];
          bool isValid = _isValidQuests[index];
          bool retry = _retry[index];

          return SayingListItem(
            saying: saying,
            controller: controller,
            isValid: isValid,
            retry: retry,
            updateState: (newIsValid, newRetry) {
              _updateState(index, newIsValid, newRetry);
            },
          );
        },
      ),
    );
  }
}
