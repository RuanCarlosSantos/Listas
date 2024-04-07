import 'package:city/src/ui/commons/app_text_style.dart';
import 'package:city/src/ui/commons/app_text.dart';
import 'package:city/src/ui/city/components/rich_text_component.dart';
import 'package:flutter/material.dart';

class CityDetail extends StatelessWidget {
  final String? _heroTag;
  final String? _image;
  final String? _name;
  final String? _state;
  final String? _population;
  final String? _area;

  const CityDetail({
    required String? heroTag,
    required String? image,
    required String? name,
    required String? state,
    required String? population,
    required String? area,
    Key? key,
  })  : _heroTag = heroTag,
        _image = image,
        _name = name,
        _state = state,
        _population = population,
        _area = area,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Hero(
                tag: _heroTag!,
                child: FutureBuilder(
                  future: precacheImage(AssetImage(_image!), context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                        height: 300,
                        width: double.maxFinite,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Image.asset(
                      _image,
                      fit: BoxFit.fill,
                      height: 300,
                      width: double.maxFinite,
                    );
                  },
                ),
              ),
              Text(
                _name!,
                style: AppTextStyle.nameStyle,
              ),
              const SizedBox(height: 16),
              RichTextComponent(
                title: AppText.stateDetailCity,
                description: _state!,
              ),
              RichTextComponent(
                title: AppText.populationDetailCity,
                description: _population!,
              ),
              RichTextComponent(
                title: AppText.areaDetailCity,
                description: '$_area km²',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
