import 'package:flutter/material.dart';

class IssuePageModel extends ChangeNotifier {
  final List agreedViewpoints = [];

  void add(int id) {
    agreedViewpoints.add(id);
    notifyListeners();
  }

  void remove(int id) {
    agreedViewpoints.remove(id);
    notifyListeners();
  }
}
