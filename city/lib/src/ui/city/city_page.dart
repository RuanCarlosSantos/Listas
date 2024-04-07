import 'package:city/src/data/city.dart';
import 'package:city/src/ui/city/city_list_item/city_list_item.dart';
import 'package:city/src/ui/commons/app_colors.dart';
import 'package:city/src/ui/commons/app_text.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  const CityPage({super.key});

  @override
  State<CityPage> createState() => _MyCityPageState();
}

class _MyCityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppText.appBarTitle),
      ),
      body: Container(
        color: AppColors.orange,
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return CityListItem(
              city: cities[index],
            );
          },
        ),
      ),
    );
  }
}
