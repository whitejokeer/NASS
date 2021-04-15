import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/models/image.dart';

class ImageController extends StateNotifier<List<ImageModel>> {
  ImageController() : super([]);

  fakeData(List<Map<String, dynamic>> data) async {
    List<ImageModel> listImage = [];
    for (var i = 0; i < data.length; i++) {
      listImage.add(ImageModel.map(data[i]));
    }
    state = [...state, ...listImage];
    return state;
  }

  addImage(ImageModel imageModel) {
    state = [...state, imageModel];
  }
}
