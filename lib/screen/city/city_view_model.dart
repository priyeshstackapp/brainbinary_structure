import 'package:brainbinary_structure/model/city_model.dart';
import 'package:brainbinary_structure/rest_api/country_rest_api.dart';
import 'package:brainbinary_structure/screen/city/city_screen.dart';
import 'package:get/get.dart';

class CityViewModel {
  CityScreenState state;

  CityModel cities;

  int selectedCity = -1;
  bool isLoading = true;

  CityViewModel(this.state) {
    getCity(state.widget.country);
  }

  countryItemClick(int index) async {
    selectedCity = index;
    state.setState(() {

    });
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

  void getCity(String country) async {
    cities = await RestApi.getCity(country);
    isLoading = false;
    state.setState(() {});
  }
}
