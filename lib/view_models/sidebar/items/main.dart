import 'package:akwaaba_user_app/models/sidebar/items/main.dart';
import 'package:flutter/material.dart';

class SidebarItemViewModel extends ChangeNotifier {
  SidebarItemModel _item = SidebarItemModel();

  SidebarItemModel get item => _item;

  set setItem(SidebarItemModel item) {
    _item = item;
  }
}
