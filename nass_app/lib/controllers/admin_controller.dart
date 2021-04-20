import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:nass_app/config/config.dart';
import 'package:nass_app/models/admin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminController extends StateNotifier<Admin> {
  AdminController() : super(Admin.empty());

  void getAdminData(num storageNumber, num syncTime) {}

  void userStorage(num storageNumber) => state.userStorage = storageNumber;

  void userSync(num syncTime) => state.syncTime = syncTime;

  Future<bool> changeAdminParameters(num userStorage, num userSync) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      "Authorization": "Bearer ${prefs.getString("token")}"
    };

    Map<String, dynamic> json = {
      "userStorage": "$userStorage",
      "userSync": "$userSync"
    };

    Response loginResponse = await put(
      Uri.parse(backURL + "/admin"),
      headers: headers,
      body: json,
    );

    int statusCode = loginResponse.statusCode;
    if (statusCode == 201) {
      state = Admin(userStorage: userStorage, syncTime: userSync);
      return true;
    } else {
      return false;
    }
  }
}
