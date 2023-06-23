import 'package:flutter/foundation.dart';

class JokesProvider with ChangeNotifier {
  bool _isSpanishSelected = false;

  bool get isSpanishSelected => _isSpanishSelected;

  set isSpanishSelected(bool value) {
    _isSpanishSelected = value;
    notifyListeners();
  }
}
