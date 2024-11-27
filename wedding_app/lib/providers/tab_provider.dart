import 'package:flutter/material.dart';

class TabProvider extends ChangeNotifier {
  /// Provider that notifies the UI when any tab is changed by the user.
  int _currentTab = 0;

  int get currentTab => _currentTab;

  void changeTab(int newTab) {
    _currentTab = newTab;
    notifyListeners();
  }
}
