import 'package:flutter/material.dart';
import 'package:dog_photo/src/ui/commons/app_colors.dart';

class DogImageGrid extends StatelessWidget {
  final List<String>? _imageURLs;
  final int? _currentImageIndex;
  final Function(int)? _onImageTap;

  const DogImageGrid({
    required List<String>? imageURLs,
    required int? currentImageIndex,
    required Function(int)? onImageTap,
    Key? key,
  })  : _imageURLs = imageURLs,
        _currentImageIndex = currentImageIndex,
        _onImageTap = onImageTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemCount: _imageURLs!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onImageTap!(index);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: index == _currentImageIndex
                      ? AppColors.amber
                      : AppColors.black,
                  width: 2,
                ),
              ),
              child: Image.network(
                _imageURLs[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
