import 'dart:ui';

import 'package:dio/dio.dart';
import "package:flutter/material.dart";
import 'package:frontend/main.dart';
import 'package:frontend/src/constants/app_user.dart';
import 'package:frontend/src/sample_feature/sample_item_details_view.dart';
import 'package:frontend/src/sample_feature/sample_item_list_view.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<AppUser>? _futureAppUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Cześć"),
          Container(
            alignment: Alignment.center,
            width: 300.0,
            child: TextField(
              controller: loginController,
              selectionWidthStyle: BoxWidthStyle.tight,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Login'),
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 300.0,
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Hasło'),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      onPressed: () async {
                                               final String login = loginController.text;
                        final String password = passwordController.text;
                        Future<AppUser>? appUser = postLogin(login, password);
                          setState(() {
                            _futureAppUser = appUser;
                          });
                        // if (_futureAppUser != null) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => const SampleItemListView())
                        //   );
                        // }
                      },
                      child: const Text("Zaloguj")
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                      onPressed: () {

                      },
                      child: const Text("Zarejestruj")
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}