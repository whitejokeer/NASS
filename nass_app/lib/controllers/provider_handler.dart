import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nass_app/controllers/images_controller.dart';
import 'package:nass_app/models/image.dart';

final imageControllerProvider = StateNotifierProvider<ImageController>((ref) {
  return ImageController();
});

final imageDataProvider = FutureProvider<List<ImageModel>>(
  (ref) async {
    return await ref.watch(imageControllerProvider).fakeData([]);
  },
);
