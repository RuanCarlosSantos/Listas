import 'package:flutter/material.dart';

class CityModel with ChangeNotifier {
  String? id;
  String? name;
  String? state;
  String? population;
  String? area;
  String? image;

  CityModel({
    this.id,
    this.name,
    this.state,
    this.population,
    this.area,
    this.image,
  });

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
    population = json['population'];
    area = json['area'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['name'] = name;
    data['state'] = state;
    data['population'] = population;
    data['area'] = area;
    data['image'] = image;

    return data;
  }
}
