import 'package:stacked/stacked.dart';

class CountryViewModel extends BaseViewModel {
  String title = 'default';

  void init() async {
    title = 'initialised';
    setBusy(true);
    notifyListeners();
    setBusy(true);
  }

  int counter = 0;
  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}