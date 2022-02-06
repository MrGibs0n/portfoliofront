import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/src/constants/app_user.dart';
import 'package:http/http.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

//
// Future<Response> postLogin(String login, String password) async {
//   var dio = Dio();
//   Response response = await dio.post(
//       'http://localhost:8080/api/v1/login',
//       data: {
//       'login': login ,
//       'password' : password
//     }, queryParameters: {
//   "Access-Control-Allow-Origin": "*",
//   "Access-Control-Allow-Credentials": "true",
//   "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
//   "Access-Control-Allow-Methods": "POST, OPTIONS"
//   });
//   return response;
// }


Future<AppUser>? postLogin(String login, String password) async {
  final response  = await post(
    Uri.parse('http://localhost:8080/api/v1/login'),
    headers: {"Content-Type":"application/json", "Access-Control-Allow-Origin": "*"},
    body: jsonEncode(<String, String>{
      'login': login ,
      'password' : password
    })
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return AppUser.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(response.body);
  }
}

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}

