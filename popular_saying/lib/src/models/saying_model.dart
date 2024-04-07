import 'package:flutter/material.dart';

class SayingModel with ChangeNotifier {
  String? id;
  String? saying;
  String? response;

  SayingModel({
    this.id,
    this.saying,
    this.response,
  });

  SayingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    saying = json['saying'];
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['saying'] = saying;
    data['response'] = response;

    return data;
  }
}
