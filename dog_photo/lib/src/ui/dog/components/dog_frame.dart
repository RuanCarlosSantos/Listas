import 'package:flutter/material.dart';

class DogFrame extends StatelessWidget {
  final String? _imageURL;

  const DogFrame({
    required String? imageURL,
    Key? key,
  })  : _imageURL = imageURL,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      _imageURL!,
      height: 180,
      width: 180,
    );
  }
}
