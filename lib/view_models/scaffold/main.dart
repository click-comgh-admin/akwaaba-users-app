import 'package:flutter/material.dart';

class ScaffoldViewModel extends ChangeNotifier {
  late GlobalKey<ScaffoldState> _scaffoldState;

  GlobalKey<ScaffoldState> get scaffoldState => _scaffoldState;

  set setScaffoldState(GlobalKey<ScaffoldState> scaffoldState) {
    _scaffoldState = scaffoldState;
    // nF(); // called once here;
  }

  nF() async {
    notifyListeners();
  }
}
