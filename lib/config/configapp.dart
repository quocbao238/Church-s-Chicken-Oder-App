// class AppConfig {
//   AppConfig._();
//   static String uiD = "";
//   static String tokenUser = "";
//   static String version = "";
//   static String buildNumber = "";
//   static String userName = "";
//   static String tokenFirebase = "";
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_blocs/repository/user_repository.dart';

class ConfigApp {
  String userUiD;
  String userEmail;

  String get getUserUiD => userUiD;
  set setUserUiD(String userUiD) => this.userUiD = userUiD;
  String get getUserEmail => userEmail;
  set setUserEmail(String userEmail) => this.userEmail = userEmail;

  ConfigApp({this.userUiD,this.userEmail});
}

FirebaseUser firebaseUser;
UserRepository userRepository;