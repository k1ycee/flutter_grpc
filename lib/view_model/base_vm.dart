import 'package:flutter/material.dart';
import 'package:flutter_grpc/repository/todo_repositoory.dart';




class BaseViewModel extends ChangeNotifier {

  final todoRepositoryInstance = TodoRepository.instance;

  bool _loading = false;
  bool get loading => _loading;

  void toggleLoading(bool val) {
    _loading = val;
    notifyListeners();
  }
}