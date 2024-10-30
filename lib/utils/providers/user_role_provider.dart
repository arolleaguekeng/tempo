import 'package:flutter/material.dart';


class UseRoleProvider extends ChangeNotifier {
  bool _userIsDriver = false;

  bool get userIsDriver => _userIsDriver ;

  void setRole(bool isDriver) {
    _userIsDriver = isDriver;
    notifyListeners();
  }

  void clearLocale() {
    notifyListeners();
  }
}
