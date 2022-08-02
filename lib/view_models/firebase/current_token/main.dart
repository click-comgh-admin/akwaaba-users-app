import 'package:akwaaba_user_app/firebase_options.dart';
import 'package:akwaaba_user_app/imports/database/firebase/current_token/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final CurrentFirebaseTokenDatabase _currentFirebaseTokenDatabase =
    CurrentFirebaseTokenDatabase();

class UserTokenViewModel extends ChangeNotifier {
  bool _loading = false;
  String _tokenString = "";

  bool get loading => _loading;
  String get tokenString => _tokenString;

  setLoading(bool loading) async {
    _loading = loading;
    nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }

  setUserTokenString(String? tokenString) {
    // print({"tokenString.toString()": tokenString.toString()});
    _tokenString = tokenString!;
  }

  Future<bool> userTokenWeb() async {
    var userTokenSuccess = false;
    try {
      setLoading(true);
      var response = await FirebaseMessaging.instance
          .getToken(vapidKey: DefaultFirebaseOptions.vapidKey);
      setUserTokenString(response);
      setToken = tokenString;
      userTokenSuccess = true;
      setLoading(false);
    } catch (e) {
      if (kDebugMode) {
        print({"firebase-get-token-error": e});
      }
    }
    return userTokenSuccess;
  }

  Future<NotificationPermissionChecked> get requestPermission async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    SnackBar snackBar;
    bool allowed;
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      allowed = true;
      snackBar = const SnackBar(content: Text("User granted permission"));
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      allowed = true;
      snackBar =
          const SnackBar(content: Text("User granted provisional permission"));
    } else {
      allowed = false;
      snackBar = const SnackBar(
        content: Text(
            "User declined or has not accepted permission, please accept permision to continue"),
        duration: Duration(seconds: 10),
      );
    }
    return NotificationPermissionChecked(snackBar: snackBar, allowed: allowed);
  }

  set setToken(String token) {
    _currentFirebaseTokenDatabase.setToken(token);
  }

  Future<String?>? get getToken async =>
      await _currentFirebaseTokenDatabase.getToken();

  Future<void> remove() async {
    setLoading(true);
    await _currentFirebaseTokenDatabase.removeToken();
    setLoading(false);
  }
}

class NotificationPermissionChecked {
  SnackBar snackBar;
  bool allowed;
  NotificationPermissionChecked({
    required this.snackBar,
    required this.allowed,
  });
}
