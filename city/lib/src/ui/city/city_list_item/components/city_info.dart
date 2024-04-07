import 'package:city/src/models/city_model.dart';
import 'package:city/src/ui/commons/app_text_style.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CityInfo extends StatelessWidget {
  final CityModel? _city;

  const CityInfo({
    required CityModel? city,
    Key? key,
  })  : _city = city,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-${_city!.id}',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ExtendedImage.asset(
            _city.image!,
            imageCacheName: _city.image,
            fit: BoxFit.fitWidth,
            height: 150,
            width: double.maxFinite,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text(
                _city.name!,
                style: AppTextStyle.nameStyle,
              ),
              const Icon(
                Icons.arrow_right_alt,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
