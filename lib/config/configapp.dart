class ConfigApp {
  String userUiD;
  String userEmail;
  String get getUserUiD => userUiD;
  set setUserUiD(String userUiD) => this.userUiD = userUiD;
  String get getUserEmail => userEmail;
  set setUserEmail(String userEmail) => this.userEmail = userEmail;
  ConfigApp({this.userUiD,this.userEmail});
}

