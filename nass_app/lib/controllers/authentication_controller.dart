import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/config.dart';

class AuthenticationController {
  Future<bool> loginRequest(String email, String password) async {
    String token;

    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded"
    };
    Map<String, dynamic> json = {"Email": "$email", "Password": "$password"};

    Response loginResponse =
        await post(Uri.parse(backURL + "/login"), headers: headers, body: json);

    int statusCode = loginResponse.statusCode;

    if (statusCode == 201) {
      token = jsonDecode(loginResponse.body)["token"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);
      return true;
    } else {
      print("Error: ${loginResponse.body}");
      return false;
    }
  }

  Future<bool> registerRequest(
      String email, String password, String nombre) async {
    String token;

    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded"
    };
    Map<String, dynamic> json = {
      "Email": "$email",
      "Password": "$password",
      "Name": "$nombre"
    };

    Response loginResponse = await post(Uri.parse(backURL + "/register"),
        headers: headers, body: json);

    int statusCode = loginResponse.statusCode;

    if (statusCode == 201) {
      token = jsonDecode(loginResponse.body)["token"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);
      return true;
    } else {
      print("Error: ${loginResponse.body}");
      return false;
    }
  }
}
