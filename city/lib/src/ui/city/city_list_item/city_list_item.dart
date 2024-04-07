import 'package:city/src/models/city_model.dart';
import 'package:city/src/ui/city/city_detail/detail_city.dart';
import 'package:city/src/ui/city/city_list_item/components/city_info.dart';
import 'package:city/src/ui/commons/app_colors.dart';
import 'package:flutter/material.dart';

class CityListItem extends StatelessWidget {
  final CityModel? _city;

  const CityListItem({
    required CityModel? city,
    Key? key,
  })  : _city = city,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: AppColors.white,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CityDetail(
                    heroTag: 'hero-${_city!.id}',
                    name: _city.name,
                    state: _city.state,
                    population: _city.population,
                    area: _city.area,
                    image: _city.image,
                  ),
                ),
              );
            },
            child: CityInfo(city: _city),
          ),
        ),
      ),
    );
  }
}
