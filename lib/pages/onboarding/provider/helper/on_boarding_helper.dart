import 'package:flutter/material.dart';

class OnBoardingHelper extends ChangeNotifier {
  int selectedIndex = 0;
  PageController controller = PageController(keepPage: false);

  setSelectedPopularIndex({
    required int index,
  }) {
    selectedIndex = index;
    notifyListeners();
  }

  listen() {
    notifyListeners();
  }
}
