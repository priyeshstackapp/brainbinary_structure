import 'package:brainbinary_structure/model/city_model.dart';
import 'package:brainbinary_structure/rest_api/country_rest_api.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class CityViewModel extends BaseViewModel {
  CityModel cities;

  int selectedCity = -1;

  String selectedCountry;

  void init(String selectedCountry) async {
    setBusy(true);
    this.selectedCountry = selectedCountry;
    await getCity();
    setBusy(false);
  }

  countryItemClick(int index) async {
    selectedCity = index;
    notifyListeners();
  }

  continueClick(int data) async {
    if (data == -1) {
      Get.snackbar(
        "Error",
        "Please select city",
      );
    } else {
      Get.snackbar(
        "Utilization",
        "Coming soon",
      );
    }
  }

  getCity() async {
    cities = await RestApi.getCity(selectedCountry);
  }
}
