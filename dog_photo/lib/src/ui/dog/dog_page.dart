import 'dart:convert';

import 'package:dog_photo/src/ui/commons/components/button/button.dart';
import 'package:dog_photo/src/ui/commons/components/loading/loading.dart';
import 'package:dog_photo/src/ui/dog/components/dog_image_grid/dog_image_grid.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dog_photo/src/ui/commons/widget_utils.dart';
import 'package:dog_photo/src/endpoints/endpoints.dart';
import 'package:dog_photo/src/ui/commons/app_colors.dart';
import 'package:dog_photo/src/ui/commons/app_text_style.dart';
import 'package:dog_photo/src/ui/commons/app_text.dart';
import 'package:dog_photo/src/ui/dog/components/modal/alert_modal_component.dart';
import 'package:dog_photo/src/ui/dog/components/dog_frame.dart';
import 'package:dog_photo/src/ui/dog/components/no_image_message.dart';

class DogPage extends StatefulWidget {
  const DogPage({super.key});

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  final List<String> _imageURL = [];

  int _currentImageIndex = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    getDogs(10);
  }

  void loading() {
    _isLoading = !_isLoading;
    setState(() {});
  }

  Future<void> getDogs(int count) async {
    loading();

    for (int i = 0; i < count; i++) {
      final response = await http.get(Uri.parse(Endpoints.getRandomDog()));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _imageURL.add(data['message']);
      } else {
        loading();
        throw Exception('Falha ao carregar imagem');
      }
    }

    setState(() {
      _currentImageIndex = _imageURL.length - 1;
      loading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenForestDeep,
        shadowColor: AppColors.white,
        elevation: 1,
        title: const Text(
          TextUtils.appBarTitle,
          style: AppTextStyle.appBarStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              WidgetUtils.showDialogUtils(
                context,
                AlertModalComponent(
                  onpressedYesOption: () {
                    _imageURL.clear();
                    _currentImageIndex = 0;
                    setState(() {});

                    Navigator.of(context).pop();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.cleaning_services_outlined,
              color: AppColors.white,
            ),
          ),
        ],
      ),
      body: Container(
        color: AppColors.greenForestDeep,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: _isLoading
                        ? const Loading()
                        : _imageURL.isNotEmpty
                            ? DogFrame(
                                imageURL: _imageURL[_currentImageIndex],
                              )
                            : const NoImageMessage(),
                  ),
                  Button(
                    onPressed: _isLoading
                        ? null
                        : () async {
                            await getDogs(1);
                          },
                  ),
                ],
              ),
            ),
            if (_imageURL.isNotEmpty) ...[
              const Text(
                TextUtils.gallery,
                style: AppTextStyle.galleryStyle,
              ),
              const SizedBox(height: 4),
              DogImageGrid(
                imageURLs: _imageURL,
                currentImageIndex: _currentImageIndex,
                onImageTap: (index) {
                  _currentImageIndex = index;
                  setState(() {});
                },
              ),
            ]
          ],
        ),
      ),
    );
  }
}
