import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:nass_app/config/config.dart';
import 'package:nass_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends StateNotifier<User> {
  HomeController() : super(User.empty());

  getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, String> headers = {
      "Authorization": "Bearer ${prefs.getString("token")}"
    };

    Response loginResponse =
        await get(Uri.parse(backURL + "/userInfo"), headers: headers);

    int statusCode = loginResponse.statusCode;

    if (statusCode == 201) {
      Map<String, dynamic> info = jsonDecode(loginResponse.body);
      state = User.adminMap(info);
      prefs.setString("userStorage", "${state.userStorage}");
      prefs.setString("userSync", "${state.userSync}");
      prefs.setString("userName", "${state.nombre}");
      return state;
    } else if (statusCode == 200) {
      Map<String, dynamic> info = jsonDecode(loginResponse.body);
      state = User.map(info);
      return state;
    } else {
      state = User.empty();
      return state;
    }
  }
}
