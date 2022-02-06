import 'dart:convert';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
  AppUser({
    required this.id,
    required this.login,
  });

  int id;
  String login;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
    id: json["id"],
    login: json["login"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "login": login,
  };

}