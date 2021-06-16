import 'package:brainbinary_structure/model/country_model.dart';
import 'package:brainbinary_structure/rest_api/country_rest_api.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';

class CountryViewModel extends BaseViewModel {
  CountryModel countryModel;

  int selectedCountry = -1;

  void init() async {
    setBusy(true);
    await getCountry();
    setBusy(false);
  }

  countryItemClick(int index) async {
    selectedCountry = index;
    notifyListeners();
  }

  continueClick(int data) async {
    if (data == -1) {
      Get.snackbar(
        "Error",
        "Please select country",
      );
    } else {
      Get.to(() => CityScreen(countryModel.data[data].country));
    }
  }

  getCountry() async {
    countryModel = await RestApi.getCountry();
  }
}
