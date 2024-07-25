import 'package:stacked/stacked.dart';

class CounterVM extends BaseViewModel {
  int count = 0;
  void counter() {
    count++;
    notifyListeners();
  }
}
