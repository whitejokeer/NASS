import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/fileData.dart';
import '../models/user.dart';
import 'admin_controller.dart';
import 'files_controller.dart';
import 'home_controller.dart';

// StateNotifiers

final homeControllerProvider = StateNotifierProvider<HomeController>((ref) {
  return HomeController();
});

final adminControllerProvider = StateNotifierProvider<AdminController>((ref) {
  return AdminController();
});

final fileDataControllerProvider =
    StateNotifierProvider<FileDataController>((ref) {
  return FileDataController();
});

// FutureProviders

final homeDataProvider = FutureProvider<User>((ref) async {
  return await ref.watch(homeControllerProvider).getUserInfo();
});

final fileDataProvider = FutureProvider.family<List<FileData>, String>(
  (ref, fileType) async {
    return await ref.watch(fileDataControllerProvider).getData(fileType);
  },
);
