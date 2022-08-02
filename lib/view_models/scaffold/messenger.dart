import 'package:flutter/material.dart';

class ScaffoldMessengerViewModel extends ChangeNotifier {
  late GlobalKey<ScaffoldMessengerState> _scaffoldState;

  GlobalKey<ScaffoldMessengerState> get scaffoldState => _scaffoldState;

  set setScaffoldMessengerState(GlobalKey<ScaffoldMessengerState> scaffoldState) {
    _scaffoldState = scaffoldState;
    nF();
  }

  nF() async {
    notifyListeners();
  }
}
