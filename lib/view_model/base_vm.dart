import 'package:flutter/material.dart';

class BaseViewModel extends ChangeNotifier {

  bool _loading = false;
  bool get loading => _loading;

  void toggleLoading(bool val) {
    _loading = val;
    notifyListeners();
  }
}